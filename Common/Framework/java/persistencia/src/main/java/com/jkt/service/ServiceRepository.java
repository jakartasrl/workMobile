package com.jkt.service;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;








//import org.hibernate.criterion.Restrictions;
import static org.hibernate.criterion.Restrictions.like;
import static org.hibernate.criterion.Restrictions.eq;
import static org.hibernate.criterion.Restrictions.ne;
import static org.hibernate.criterion.Restrictions.ge;
import static org.hibernate.criterion.Restrictions.le;
import static org.hibernate.criterion.Restrictions.gt;
import static org.hibernate.criterion.Restrictions.lt;

import org.hibernate.criterion.SimpleExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jkt.dominio.Filtro;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.EntityNotFoundException;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionException;
import com.jkt.persistencia.IServiceRepository;
import com.jkt.persistencia.ISessionProvider;
import com.jkt.util.RepositorioClases;

/**
 * Implementacion del servicio.
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Service
@SuppressWarnings("rawtypes")
public class ServiceRepository implements IServiceRepository {

	private static final String CONDICION_LIKE = "like";
	private static final String CONDICION_MAYOR_IGUAL = "mayorigual";
	private static final String CONDICION_MAYOR = "mayor";
	private static final String CONDICION_MENOR_IGUAL = "menorigual";
	private static final String CONDICION_MENOR = "menor";
	private static final String CONDICION_DISTINTO = "distinto";
	private static final String CONDICION_IGUAL = "igual";
	private static final String MENSAJE_ERROR_VALIDACION = "Error al intentar ejecutar la validación de regla de negocio.";
	private static final String CAMPO_ACTIVO = "activo";
	private static final String WILD_CHAR = "%";

	
	private static final String INTEGER = "integer";
	private static final String STRING = "string";
	private static final String BOOLEAN = "boolean";
	private static final String DATE = "date";

	
	private ISessionProvider sessionProvider;

	
	@Autowired
	public void setSessionProvider(ISessionProvider sessionProvider) {
		this.sessionProvider=sessionProvider;
	}
	
	private Session getSession(){
		return sessionProvider.getSession();
	}

	public PersistentEntity save(PersistentEntity entity)throws ClassNotFoundException, InstantiationException,IllegalAccessException, ValidacionException {
		ejecutarValidacionDeNegocio(entity);
		getSession().save(entity);
		return entity;
	}

	private void ejecutarValidacionDeNegocio(PersistentEntity entity) throws InstantiationException, IllegalAccessException, ValidacionException {
		String validadorClassName;
		try {
			validadorClassName = RepositorioClases.getValidador(entity.getClass().getCanonicalName());
			if (validadorClassName != null && !validadorClassName.isEmpty()) {
				Class<?> clase = Class.forName(validadorClassName);
				Method method;
				method = clase.getMethod("validar", PersistentEntity.class);
				Object instance = clase.newInstance();
				method.invoke(instance, entity);
			}
		}catch(ClassNotFoundException e){
			throw new ValidacionException(MENSAJE_ERROR_VALIDACION);
		}catch (JakartaException e) {
			throw new ValidacionException(MENSAJE_ERROR_VALIDACION);
		}catch (NoSuchMethodException e) {
			throw new ValidacionException(MENSAJE_ERROR_VALIDACION);
		}catch (SecurityException e) {
			throw new ValidacionException(MENSAJE_ERROR_VALIDACION);
		}catch (IllegalArgumentException e) {
			throw new ValidacionException(MENSAJE_ERROR_VALIDACION);
		}catch (InvocationTargetException e) {
			throw new ValidacionException(MENSAJE_ERROR_VALIDACION);
		}
	}

	public List<PersistentEntity> guardarObjetos(List<PersistentEntity> aEntities) throws ClassNotFoundException, InstantiationException, IllegalAccessException, ValidacionException {
		for (PersistentEntity persistentEntity : aEntities) {
			save(persistentEntity);
		}
		return aEntities;
	}
	
	public List<PersistentEntity> getAll(Class clazz) throws Exception {
		Criteria criteria = createCriteria(clazz);
		criteria.add(getRestrictionForRetrieveActive());
		return criteria.list();
	}

	public PersistentEntity getByOid(Class clazz, long id) throws Exception,EntityNotFoundException {
		PersistentEntity entityRetrieved = (PersistentEntity) getSession().get(clazz, id);
		if (entityRetrieved==null) {
			throw new EntityNotFoundException("No existe la entidad solicitada.");
		}
		return entityRetrieved;
	}
	
	public PersistentEntity getUniqueByProperty(Class className, String propertyName,String value) {
		Criteria criteria = createCriteria(className);

		criteria.add(eq(propertyName, value));
		criteria.add(getRestrictionForRetrieveActive());
		
		return (PersistentEntity) criteria.uniqueResult();
	}

	public PersistentEntity getUniqueByProperty(Class className,String propertyName, Long value) {
		Criteria criteria = createCriteria(className);
		
		criteria.add(eq(propertyName, value));
		criteria.add(getRestrictionForRetrieveActive());
		
		return (PersistentEntity) criteria.uniqueResult();
	}

	public List<PersistentEntity> getByProperty(Class className, String propertyName,String value) {
		Criteria criteria = createCriteria(className);

		criteria.add(getRestrictionForRetrieveActive());
		criteria.add(like(propertyName, value));
		
		return criteria.list();
	}


	public List<PersistentEntity> getByProperties(Class className, List properties) {
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
		
		return criteria.list();
	}

	/**
	 * @param criteria para agregar la condicion, es el target
	 * @param propertyName propiedad del objeto, atributo del mismo
	 * @param condicion -
	 * @param tipo tipo de valor que sera puesto en prueba
	 */
	private void agregarCriteria(Criteria criteria, String propertyName, String condicion, Object tipo) {
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
	
	private Object resolveType(String type, String value){
		if (BOOLEAN.equals(type)) {
			return new Boolean(value.toLowerCase());
		}else if (INTEGER.equals(type)) {
			return Long.valueOf(value);
		}else if (STRING.equals(type)) {
			return value;
		}else if (DATE.equals(type)) {
			throw new RuntimeException("Tipo de dato aun no implementado.");
//			Date date = new Date();
			/*
			 * 
			 */
//			return date;
		}else{
			return null;
		}
	}
}
