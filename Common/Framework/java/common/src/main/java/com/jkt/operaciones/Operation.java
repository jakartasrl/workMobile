package com.jkt.operaciones;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Observable;
import java.util.Set;

import javax.servlet.ServletOutputStream;
import javax.validation.ConstraintViolation;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.framework.writers.IHeaderDataSet;
import com.jkt.persistencia.IServiceRepository;
import com.jkt.persistencia.ISessionProvider;
import com.jkt.request.EventBusiness;
import com.jkt.request.IEventBusiness;
import com.jkt.transformers.EmptyTransformer;
import com.jkt.transformers.Notificacion;
import com.jkt.transformers.Transformer;
import com.jkt.util.IRepositorioClases;
import com.jkt.xmlreader.ElementTransformer;

/**
 * 
 * Cada evento del lado del cliente que tiene una accion en el
 * servidor, genera una instancia de una operacion.<br>
 * Estas están configuradas en la aplicacion. Cada operacion que genera la
 * metodologia invoca al metodo execute().<br>
 * Dentro de este metodo (abstracto en esta clase), esta la logica de la
 * resolucion del evento. 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Service
public abstract class Operation extends Observable {
	protected static final Logger log = Logger.getLogger(Operation.class);

	private ISessionProvider sessionProvider;
	protected Session session;
	protected IServiceRepository serviceRepository;
	protected IEventBusiness ev;
	
	@Autowired
	public void setEventBusiness(IEventBusiness e) {
		this.ev=e;
	}
	
	private IRepositorioClases repositorioClases;
	
	public IRepositorioClases getRepositorioClases() {
		return repositorioClases;
	}

	@Autowired
	public void setRepositorioClases(IRepositorioClases repositorioClases) {
		this.repositorioClases = repositorioClases;
	}

	public ISessionProvider getSessionProvider() {
		return sessionProvider;
	}

	@Autowired
	public void setSessionProvider(ISessionProvider sessionProvider) {
		this.sessionProvider = sessionProvider;
	}

	protected void destroySession(){
		session.close();
		session=null;
	}

	public Operation() {}

	public IHeaderDataSet getHeaderDataSet(String aTabName) {
		return ev.getHeaderDataSet(aTabName);
	}

	public IServiceRepository getServiceRepository() {
		return serviceRepository;
	}

	@Autowired
	public void setServiceRepository(IServiceRepository serviceRepository) {
		this.serviceRepository = serviceRepository;
	}

	/**
	 * Patron Template method. Se define un estructura basica, y se toma la
	 * implementacion de las subclases.
	 * 
	 */
	public Transformer generateTransformer(ServletOutputStream outputStream, EventBusiness eventBusiness, String outputName)
			throws JakartaException, ClassNotFoundException,InstantiationException, IllegalAccessException {
		
		ElementTransformer elementTransformer = eventBusiness.getTransformer();

		/*
		 * Creacion del transformer. Cada bean de los transformers son de scope
		 * prototype, xq se agregaran como observers a diferentes instancias.
		 * 
		 * Desde el contexto web es complicado recuperar beans, no es tan simple
		 * como recuperar el contexto con XMLClassPath o FileClassPath.
		 * 
		 * Lo que se hace es instanciar el transformer con reflection.
		 * Posteriormente, se inyecta por constructor lo necesario.
		 */

		Transformer transformer = null;
		if (elementTransformer != null) {
			
			try{
				Class<?> clazz = Class.forName(elementTransformer.getClase());
				Object instance = clazz.newInstance();
				transformer = (Transformer) instance;
			}catch(ClassNotFoundException e){
				throw new JakartaException("No se puede iniciar el transformador indicado.Compruebe el archivo de las operaciones...");
			}
		} else {
			transformer = new EmptyTransformer();
		}

		// Parametrizacion del mismo
		transformer.setEvent(eventBusiness);
		transformer.setup(outputStream, outputName);
		this.addObserver(transformer);

		return transformer;
	}

	/**
	 * 
	 * Notifica al transformer un objeto para que lo procese.
	 * 
	 * @param parameter
	 *            que llegara el transformer.Dependiendo del tipo de transformer
	 *            se notifica de diferentes maneras.
	 * 
	 * @deprecated ahora se debe utilizar el metodo con un writer y el objeto a notificar.Usar este metodo: {@link #notificarObjeto(String, Object)}
	 */
	protected void notificarObjecto(Object parameter) {
		this.setChanged();
		notifyObservers(parameter);
	}
	
	/**
	 * Notifica un objeto en el writer proporcionado
	 * 
	 * @param writer nombre del writer donde se escribe la salida. Generalmente vendra de una constante propia de la operacion.
	 * @param parametro representa al parametro a mostrar en la salida.
	 */
	protected void notificarObjeto(String writer, Object parameter) {
		this.setChanged();
		notifyObservers(Notificacion.getNew(writer, parameter));
	}

	
	/**
	 * Crea una nueva criteria indicando como root entity la clase enviada por parametros.
	 */
	protected Criteria crearCriterio(Class rootEntity){
		Session session = sessionProvider.getSession();
		return session.createCriteria(rootEntity);
	}
	
	/**
	 * @param hql
	 * @return
	 */
	protected Query crearHQL(String hql){
		Session session = sessionProvider.getSession();
		return session.createQuery(hql);
	}
	
	
	
	/**
	 * <p>Metodo principal de la operacion.</p>
	 * <p>Es el metodo a implementar en cualquier operacion.</p>
	 * 
	 * 
	 * @param aParams
	 * @throws Exception cuando ocurre cualquier error, deberia wrapper la exception y guardarle dentro de {@link Exception}
	 */
	public void runOperation(Map<String, Object> aParams) throws Exception{
		session = sessionProvider.getSession();
		serviceRepository.setSessionProvider(sessionProvider);
		serviceRepository.setRepositorioClases(repositorioClases);
		Transaction tx = session.beginTransaction();
		try{
			execute(aParams);//UOW
			tx.commit();
			sessionProvider.destroySession();
		}catch(javax.validation.ConstraintViolationException e){
			Set<ConstraintViolation<?>> constraintViolations = e.getConstraintViolations();
			constraintViolations.size();
			StringBuffer buffer=new StringBuffer();
			
			for (ConstraintViolation<?> constraintViolation : constraintViolations) {
				buffer.append(constraintViolation.getMessage());
				break;
			}
			
			tx.rollback();
			sessionProvider.destroySession();
			
			throw new ValidacionDeNegocioException(buffer.toString());
		}catch(RuntimeException exception){
			//Hago el rollback y muestro el mensaje critico en frontend.
			tx.rollback();
			sessionProvider.destroySession();
			throw exception;
		}catch(Exception exception){
			//Hago el rollback y muestro el mensaje critico en frontend.
			tx.rollback();
			sessionProvider.destroySession();
			throw exception;
		}finally{
			if (tx.isActive()) {
				tx.commit();
			}
			sessionProvider.destroySession();
		}
	}
	
	public abstract void execute(Map<String, Object> aParams) throws Exception;
	
	@SuppressWarnings({"rawtypes", "unchecked"})
	protected List recuperarObjeto(Map<String, Object> aParams) {
		List object;
		if (aParams.get("objeto")  instanceof List) {
			object = (List) aParams.get("objeto");
		}else{
			object = new ArrayList<Object>();
			object.add(aParams.get("objeto"));
		}
		return object;
	}
	
	protected PersistentEntity guardar(PersistentEntity entityToSave) throws ClassNotFoundException, InstantiationException, IllegalAccessException, ValidacionDeNegocioException, JakartaException{
		serviceRepository.save(entityToSave);
		return entityToSave;
	}
	
	/**
	 * Recupera una entidad persistente utilizando el nombre de la clase y el id
	 * 
	 */
	protected PersistentEntity obtener(Class<? extends PersistentEntity> className, long id) throws Exception{
		return serviceRepository.getByOid(className, id);
	}
	/**
	 * Recupera todas las entidades persistentes utilizando el nombre de la clase.
	 * 
	 */
	protected List<PersistentEntity> obtenerTodos(Class<? extends PersistentEntity> className) throws Exception{
		return serviceRepository.getAll(className);
	}

	/**
	 * <p>Recupera una entidad persistente utilizando el nombre de la clase y el id.</p>
	 * <p>Metodo sobre cargado que recibe un numero en formto de String.Se intentara pasar a numero y si no es numerico se levanta una excepcion</p>
	 * 
	 * @param className que representa a la clase a buscar
	 * @param id para identificarlo.
	 * @return una entidad persistente, que se corresponde con la clase y el ID solicitado.
	 * @throws Exception Si la instancia de la clase con el id proporcionado no existe, se levanta una {@link JakartaException}
	 */
	protected PersistentEntity obtener(Class<? extends PersistentEntity> className, String id) throws Exception{
		long identificador = 0;
		try{
			identificador=Long.valueOf(id).longValue();
		}catch(NumberFormatException exception){
			throw new JakartaException("Por favor, ingrese un identificador numerico.");
		}
		return serviceRepository.getByOid(className,identificador);
	}
	
	/**
	 * Verifica que el mapa de los parametros no venga nulo/vacio y en darse este caso se levanta una excepcion.
	 * 
	 * @see JakartaException
	 * @see Operation
	 * 
	 */
	protected void verificarMapaVacio(Map<String, Object> aParams) throws JakartaException{
		if (aParams==null || aParams.isEmpty()) {
			throw new JakartaException("La operacion necesita recibir parametros.");
		}
	}
	
	/**
	 * <p>Se usa para verificar objetos de entrada de la operacion.</p>
	 * <p>La entrada siempre es en un mapa, con lo cual esta funcion debe llamarse dle siguiente modo:</p>
	 * 
	 * <p><code>validarEntrada(aParams.get("keyDelMapa"))</code></p>
	 * 
	 * @param object, generalmente será un objeto del mapa.
	 * @throws JakartaException Si el objeto no existe en e mapa, o si es un string vacio.
	 */
	protected void validarEntrada(Object object) throws JakartaException{
		String valor=(String) object;
		String mensaje = "No se encuentra la entrada esperada en la operacion.";
		
		if (valor==null) {
			throw new JakartaException(mensaje);
		}
		
		if (valor.trim().isEmpty()) {
			throw new JakartaException(mensaje);
		}
	}
	
	/**
	 * Notifica una lista de objetos en el writer proporcionado
	 * 
	 * @param writer nombre del writer donde se escribe la salida. Generalmente vendra de una constante propia de la operacion.
	 * @param lista Lista de elementos a notificar.
	 */
	protected void notificarObjetos(String writer, List lista) {
		for (Object persistentEntity : lista) {
			notificarObjeto(writer, persistentEntity);
		}
	}

}