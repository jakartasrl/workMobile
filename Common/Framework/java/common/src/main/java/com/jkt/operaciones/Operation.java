package com.jkt.operaciones;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Observable;

import javax.servlet.ServletOutputStream;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionException;
import com.jkt.framework.writers.IHeaderDataSet;
import com.jkt.persistencia.IServiceRepository;
import com.jkt.persistencia.ISessionProvider;
import com.jkt.request.EventBusiness;
import com.jkt.request.IEventBusiness;
import com.jkt.transformers.EmptyTransformer;
import com.jkt.transformers.Transformer;
import com.jkt.util.IRepositorioClases;
import com.jkt.util.RepositorioClases;
import com.jkt.xmlreader.ElementTransformer;

/**
 * Description: Cada evento del lado del cliente que tiene una accion en el
 * servidor, genera una instancia de una operacion.<br>
 * Estas estan configuradas en la aplicacion. Cada operacion que genera la
 * metodologia invoca al metodo execute().<br>
 * Dentro de este metodo (abstracto en esta clase), esta la logica de la
 * resolucion del evento. Copyright: Copyright (c) 2001 Company: JAKARTA SRL
 * 
 * Modificacion de esta clase para permitir el manejo de un servicio que se
 * encarga del manejo de transacciones.
 * 
 * @see ServiceRepository
 */

@Service
public abstract class Operation extends Observable {
	protected static final Logger log = Logger.getLogger(Operation.class);

	private ISessionProvider sessionProvider;
	protected Session session;
	protected IServiceRepository serviceRepository;
	protected IEventBusiness ev;

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
	 * 
	 * @param outputStream
	 * @param eventBusiness
	 * @return
	 * @throws JakartaException
	 * @throws ClassNotFoundException
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 */
	public Transformer generateTransformer(ServletOutputStream outputStream,
			EventBusiness eventBusiness, String outputName)
			throws JakartaException, ClassNotFoundException,
			InstantiationException, IllegalAccessException {
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
			Class<?> clazz = Class.forName(elementTransformer.getClase());
			Object instance = clazz.newInstance();
			transformer = (Transformer) instance;
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
	 */
	protected void notificarObjecto(Object parameter) {
		setChanged();
		notifyObservers(parameter);
	}

	/**
	 * <p>
	 * Metodo principal de la operacion.
	 * </p>
	 * <p>
	 * Es el metodo a implementar en cualquier operacion.
	 * </p>
	 * 
	 * 
	 * @param aParams
	 * @throws Exception
	 *             cuando ocurre cualquier error, deberia wrapper la exception y
	 *             guardarle dentro de {@link Exception}
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
		}catch(RuntimeException exception){
			//Hago el rollback y muestro el mensaje critido en frontend.
			tx.rollback();
			sessionProvider.destroySession();
			throw exception;
		}catch(Exception exception){
			//Hago el rollback y muestro el mensaje critido en frontend.
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
	
	protected PersistentEntity guardar(PersistentEntity entityToSave) throws ClassNotFoundException, InstantiationException, IllegalAccessException, ValidacionException{
		serviceRepository.save(entityToSave);
		return entityToSave;
	}
}