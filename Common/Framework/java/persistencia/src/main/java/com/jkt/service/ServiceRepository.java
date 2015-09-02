package com.jkt.service;

import static org.hibernate.criterion.Restrictions.eq;
import static org.hibernate.criterion.Restrictions.ge;
import static org.hibernate.criterion.Restrictions.gt;
import static org.hibernate.criterion.Restrictions.le;
import static org.hibernate.criterion.Restrictions.like;
import static org.hibernate.criterion.Restrictions.lt;
import static org.hibernate.criterion.Restrictions.ne;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.validation.ConstraintViolation;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.SimpleExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jkt.dominio.Descriptible;
import com.jkt.dominio.Filtro;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.EntityNotFoundException;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.operaciones.ValidacionDeNegocio;
import com.jkt.persistencia.IServiceRepository;
import com.jkt.persistencia.ISessionProvider;
import com.jkt.util.IRepositorioClases;

/**
 * Implementacion del servicio.
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Service
@SuppressWarnings("rawtypes")
public class ServiceRepository implements IServiceRepository {

	public static final String CONDICION_LIKE = "like";
	public static final String CONDICION_MAYOR_IGUAL = "mayorigual";
	public static final String CONDICION_MAYOR = "mayor";
	public static final String CONDICION_MENOR_IGUAL = "menorigual";
	public static final String CONDICION_MENOR = "menor";
	public static final String CONDICION_DISTINTO = "distinto";
	public static final String CONDICION_IGUAL = "igual";
	public static final String CAMPO_ACTIVO = "activo";
	public static final String WILD_CHAR = "%";

	public static final String MENSAJE_ERROR_VALIDACION = "Error al intentar ejecutar la validación de regla de negocio.";

	
	//FIXME USAR LA CLASE DE CONSTANTES DE TIPO ACA, TIPOSDEDATO
	public static final String INTEGER = "integer";
	public static final String LONG = "long";
	public static final String STRING = "string";
	public static final String BOOLEAN = "boolean";
	public static final String DATE = "date";

	
	private ISessionProvider sessionProvider;
	
	protected IRepositorioClases repositorioClases;
	
	public IRepositorioClases getRepositorioClases() {
		return repositorioClases;
	}

//	@Autowired
	public void setRepositorioClases(IRepositorioClases repositorioClases) {
		this.repositorioClases = repositorioClases;
	}

//	@Autowired
	public void setSessionProvider(ISessionProvider sessionProvider) {
		this.sessionProvider=sessionProvider;
	}
	
	private Session getSession(){
		return sessionProvider.getSession();
	}

	public PersistentEntity save(PersistentEntity entity)throws ClassNotFoundException, InstantiationException,IllegalAccessException, ValidacionDeNegocioException, JakartaException {
		
//		validarCodigo(entity);
		
		ejecutarValidacionDeNegocio(entity);
//		ejecutarReglasDeNegocio(entity);
		try{
			getSession().saveOrUpdate(entity);
		}catch(javax.validation.ConstraintViolationException e){
			Set<ConstraintViolation<?>> constraintViolations = e.getConstraintViolations();
			constraintViolations.size();
			StringBuffer buffer=new StringBuffer();
			String message = null;
			for (ConstraintViolation<?> constraintViolation : constraintViolations) {
				
//				buffer.append(constraintViolation.getPropertyPath()+"->"+constraintViolation.getMessage());
				buffer.append(constraintViolation.getMessage());
//				buffer.append(constraintViolation.getMessage().concat("\n"));
				break;//Solo el primer mensaje es mostrado, por cuestiones del 'enter' en los clientes, no se podia pasar en hexa o \n..
			}
			throw new ValidacionDeNegocioException(buffer.toString());
		}
		return entity;
	}

	private void validarCodigo(PersistentEntity entity) throws JakartaException {
		Descriptible desc;
		if(Descriptible.class.isAssignableFrom(entity.getClass())){
			desc=(Descriptible) entity;
			String codigo = desc.getCodigo();
			List<PersistentEntity> entidadesPorCodigo = getByProperty(entity.getClass(), "codigo", codigo);
			
			if (entity.getId()!=0) {
				//es actualizacion!
			}else{
				//es nuevo!
				if (!entidadesPorCodigo.isEmpty()) {
					throw new JakartaException(String.format("No se puede guardar esta entidad de tipo %s ya que existe una con el codigo %s.",entity.getClass().getSimpleName(), codigo));
				}
			}
			
		}		
	}

	private void ejecutarValidacionDeNegocio(PersistentEntity entity) throws InstantiationException, IllegalAccessException, ValidacionDeNegocioException {
		String validadorClassName;
		try {
			validadorClassName = repositorioClases.getValidador(entity.getClass().getCanonicalName());
			if (validadorClassName != null && !validadorClassName.isEmpty()) { //hacerle un trim al nombre de la clase para preguntar si es vacio.
				Class<?> clase = Class.forName(validadorClassName);
				ValidacionDeNegocio instance = (ValidacionDeNegocio) clase.newInstance();
				instance.setServiceRepository(this); //setea el service repository para poder interactuar con la base de datos
				instance.validar(entity);
			}
		}catch(ClassNotFoundException e){
			throw new ValidacionDeNegocioException(MENSAJE_ERROR_VALIDACION);
		}catch (JakartaException e) {
			throw new ValidacionDeNegocioException(MENSAJE_ERROR_VALIDACION);
		}catch (SecurityException e) {
			throw new ValidacionDeNegocioException(MENSAJE_ERROR_VALIDACION);
		}catch (IllegalArgumentException e) {
			throw new ValidacionDeNegocioException(MENSAJE_ERROR_VALIDACION);
		}
	}

	public List<PersistentEntity> guardarObjetos(List<PersistentEntity> aEntities) throws ClassNotFoundException, InstantiationException, IllegalAccessException, ValidacionDeNegocioException, JakartaException {
		for (PersistentEntity persistentEntity : aEntities) {
			save(persistentEntity);
		}
		return aEntities;
	}
	
	public List<PersistentEntity> getAll(Class clazz) throws Exception {
		Criteria criteria = createCriteria(clazz);
		return criteria.list();
	}

	public PersistentEntity getByOid(Class clazz, long id) throws Exception,EntityNotFoundException {
		PersistentEntity entityRetrieved = (PersistentEntity) getSession().get(clazz, id);
		if (entityRetrieved==null) {
			throw new EntityNotFoundException(String.format("No existe la entidad %s con identificador %s.", clazz.getSimpleName(), String.valueOf(id)));
		}
		return entityRetrieved;
	}
	
	public PersistentEntity getUniqueByProperty(Class className, String propertyName,String value) throws JakartaException {
		Criteria criteria = createCriteria(className);
		criteria.add(eq(propertyName, value));

		try{
			return (PersistentEntity) criteria.uniqueResult();
		}catch(org.hibernate.NonUniqueResultException e){
			throw new JakartaException(String.format("Existe una inconsistencia con la entidad %s. Existen mas entidades con el mismo valor %s",className.getSimpleName(), value));
		}
	}

	public PersistentEntity getUniqueByProperty(Class className,String propertyName, Long value) throws JakartaException {
		Criteria criteria = createCriteria(className);
		criteria.add(eq(propertyName, value));
		
		try{
			return (PersistentEntity) criteria.uniqueResult();
		}catch(org.hibernate.NonUniqueResultException e){
			throw new JakartaException(String.format("Existe una inconsistencia con la entidad %s. Existen mas entidades con el mismo valor %s",className.getSimpleName(), String.valueOf(value)));
		}
	}

	public List<PersistentEntity> getByProperty(Class className, String propertyName,String value) {
		Criteria criteria = createCriteria(className);
		criteria.add(like(propertyName, value));
		return criteria.list();
	}


	public List<PersistentEntity> getByProperties(Class className, List properties) throws JakartaException {
		Criteria criteria = createCriteria(className);

		Filtro filtro;
		String propertyName;
		String value;
		String tipoDeDato;
		String condicion;
		
		for (Object object : properties) {
			filtro=(Filtro) object;
			
			propertyName = filtro.getNombre();
			value = filtro.getValor();
			tipoDeDato = filtro.getTipoDeDato().toLowerCase();
			condicion = filtro.getCondicion().toLowerCase();

			Object tipo = resolveType(tipoDeDato, value);
			
			if (tipo==null || condicion==null) {
				continue;
			}
			
			agregarCriteria(criteria, propertyName, condicion, tipo);
			
		}
		
		try{
			return criteria.list();
		}catch(org.hibernate.QueryException exp){
			throw new JakartaException("Ocurrio un error. Al parecer el filtro que realiza no coincide con las relaciones establecidas en la entidad.");
		}
	}

	/**
	 * @param criteria para agregar la condicion, es el target
	 * @param propertyName propiedad del objeto, atributo del mismo
	 * @param condicion -
	 * @param tipo tipo de valor que sera puesto en prueba
	 */
	private void agregarCriteria(Criteria criteria, String propertyName, String condicion, Object tipo) {
		
		String[] splitedProperty = propertyName.split("\\.");
		if(splitedProperty.length>1){
			String[] array = splitedProperty;
			criteria.createAlias(array[0],array[0]);
			for(int i=1; i< (array.length-1); i++ ){
				criteria.createAlias(array[i-1]+"."+array[i], array[i]);
			}
			
			propertyName= array[array.length-2]+"."+array[array.length-1];
		}
		
		
		if (CONDICION_IGUAL.equals(condicion)) {
			criteria.add(eq(propertyName, tipo));
			return;
		}

		if (CONDICION_DISTINTO.equals(condicion)) {
			criteria.add(ne(propertyName, tipo));
			return;
		}
		
		if (CONDICION_MENOR.equals(condicion)) {
			criteria.add(lt(propertyName, tipo));
			return;
		}

		if (CONDICION_MENOR_IGUAL.equals(condicion)) {
			criteria.add(le(propertyName, tipo));
			return;
		}
		
		if (CONDICION_MAYOR.equals(condicion)) {
			criteria.add(gt(propertyName, tipo));
			return;
		}
		
		if (CONDICION_MAYOR_IGUAL.equals(condicion)) {
			criteria.add(ge(propertyName, tipo));
			return;
		}
		
		if (CONDICION_LIKE.equals(condicion)) {
			criteria.add(like(propertyName, String.format("%s%s%s", WILD_CHAR, tipo ,WILD_CHAR)));
			return;
		}
	}
	
	private Criteria createCriteria(Class className) {
		return getSession().createCriteria(className);
	}

	private SimpleExpression getRestrictionForRetrieveActive() {
		return eq(CAMPO_ACTIVO, true);
	}
	
	private Object resolveType(String type, String value) throws JakartaException{
		if (BOOLEAN.equals(type)) {
			return new Boolean(value.toLowerCase());
		}else if (INTEGER.equals(type)) {
			return Integer.valueOf(value);
		}else if (LONG.equals(type)) {
			return Long.valueOf(value);
		}else if (STRING.equals(type)) {
			return value;
		}else if (DATE.equals(type)) {
			throw new JakartaException("Tipo de dato aun no implementado para enviar consultas.");
//			Date date = new Date();
			/*
			 * parsear el string recibido desde el cliente
			 */
//			return date;
		}else{
			return null;
		}
	}

	public PersistentEntity getByProperties(Class className, Map<String, Object> map) throws JakartaException {
		Criteria criteria = getSession().createCriteria(className);
		Entry<String,Object> entry=null;
		
		for (Iterator<Entry<String, Object>> iterator = map.entrySet().iterator(); iterator.hasNext();) {
			entry = (Entry<String,Object>) iterator.next();
			criteria.add(Restrictions.eq(entry.getKey(), entry.getValue()));
		}
		
		try{
			return (PersistentEntity) criteria.uniqueResult();
		}catch(org.hibernate.QueryException exp){
			throw new JakartaException("Ocurrio un error. Al parecer la entidad maestra proporcionada no es correcta.");
		}
	}

	public Query crearHQL(String hql) {
		Session session = sessionProvider.getSession();
		return session.createQuery(hql);
	}
	
	

}
