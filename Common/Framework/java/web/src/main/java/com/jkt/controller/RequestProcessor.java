package com.jkt.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jkt.contexto.ApplicationContext;
import com.jkt.excepcion.EntityNotFoundException;
import com.jkt.excepcion.JakartaException;
import com.jkt.operaciones.Operation;
import com.jkt.persistencia.IServiceRepository;
import com.jkt.request.EventBusiness;
import com.jkt.request.IEventBusiness;
import com.jkt.service.SessionProvider;
import com.jkt.transformers.Transformer;
import com.jkt.util.MapDS;
import com.jkt.xmlreader.XMLEntity;

/**
 * Abstract class that represents to main controller.
 * Clase abstracta que representa el controller principal.
 * 
 * Each implementation of parser for different clients, must be subclass of this class.
 * Cada implementacion del parseo para diferentes clientes, deben ser clases hijas de esta clase.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Scope("request")
public abstract class RequestProcessor extends BaseController{
	
	private static final String KEY_NOMBRE_OPERACION = "op";
	private static final String OUTPUT_DATASET_NAME = "outputDatasetName";

	@Autowired
	protected SessionProvider sessionProvider;
	
	@Autowired
	protected IServiceRepository serviceRepository;
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private ApplicationContext applicationContext;
	
	public ServletContext getServletContext() {
		return servletContext;
	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	protected static final Logger log = Logger.getLogger(RequestProcessor.class);
		
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/xml", method = RequestMethod.POST)
	public void handleXML(HttpServletRequest request, HttpServletResponse response)throws Exception,EntityNotFoundException {

		setOutputStream(response.getOutputStream());//setea el writer para cuando el controller sea notificado sepa donde escribir la respuesta.

		log.debug(String.format("Se inicia una solicitud desde un cliente %s",this.getAppRequest()));
		
		log.debug("Parseando la solicitud a un mapa...");
		MapDS parameters = (MapDS) retrieveParameters(request);
		
		log.debug("Recuperando nombre y objeto de operacion.");
		String operationName = parameters.getString(KEY_NOMBRE_OPERACION);
		IEventBusiness eventBusinessOperation = getOperation(operationName);
		
		if (eventBusinessOperation==null) {
			finalizar();
		}
		
		Operation operation=recuperarOperacion(eventBusinessOperation);
		if (operation==null) {
			finalizar();
		}
		
		Map parametersAdapted = null;
		
		
		/*
		 * 	TODO Implementar una estrategia ya que pueden ser 3 tipos de request.
		 * 
		 * 1-request con parametros
		 * 2-request con argumentos de configuracion
		 * 3-request con argumentos de configuracion y ademas parametros
		 * 
		 */
		
		try{
		String entidad = ((EventBusiness) eventBusinessOperation).getEntidad();
		if (entidad==null || entidad.isEmpty()) {
			log.debug("Adaptando la entrada de parametros de acuerdo a la operación solicitada...");
			parametersAdapted = this.adaptParameters(parameters, eventBusinessOperation);
		}else{
			log.debug("No existen parametros de entrada. Se toma como filtro una entidad...");
			parametersAdapted = new HashMap<String, String>();
			parametersAdapted.put("entidad", entidad);
		}
		

		log.debug("Recuperando un transformer para la operación actual...");
		Transformer transformer = operation.generateTransformer(this.getOutputStream(), (EventBusiness) eventBusinessOperation, (String)parametersAdapted.get(OUTPUT_DATASET_NAME));

		log.debug("Ejecutando la operación...");
		operation.runOperation(parametersAdapted);
		
		log.debug("Enviando resultados de la operación...");
		transformer.write();
		
//		}catch(Exception exception){
			//Hago el rollback y muestro el mensaje critido en frontend.
//			tx.rollback();
//			throw exception;
		}finally{
//			if (tx.isActive()) {
//				tx.commit();
//			}
			sessionProvider.destroySession();
		}
		log.debug("Finalizó la operación...");
	}

	/**
	 * @param eventBusinessOperation
	 * @return
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 * @throws ClassNotFoundException 
	 */
	private Operation recuperarOperacion(IEventBusiness eventBusinessOperation) throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		String clase = ((EventBusiness)eventBusinessOperation).getClase();
		Class<?> forName = Class.forName(clase);
		Object newInstance = forName.newInstance();
		Operation op=(Operation)newInstance;
		op.setServiceRepository(serviceRepository);
		op.setSessionProvider(sessionProvider);
		return op;
	}

	/**
	 * Finaliza si la operacion no existe.
	 * 
	 * @throws JakartaException
	 */
	private void finalizar() throws JakartaException {
		log.debug("No existe la operación solicitada.Se finaliza la petición.");
		throw new JakartaException("No existe la operación solicitada.Se finaliza la petición.Compruebe el archivo XML y el nombre dado a la operacion.");
	}

	/**
	 * Recupera una operacion
	 * 
	 * @param operationName
	 * @return
	 */
	protected IEventBusiness getOperation(String operationName){
		XMLEntity hijo = (XMLEntity) applicationContext.retrieveBusinessObject().getHijo(operationName);
		return (IEventBusiness) hijo;
	}
	

	public ApplicationContext getApplicationContext() {
		return applicationContext;
	}

	public void setApplicationContext(ApplicationContext applicationContext) {
		this.applicationContext = applicationContext;
	}
	
	/*
	 * Methods that must be will implemented.
	 */
	abstract protected String getAppRequest();
	
	@SuppressWarnings("rawtypes")
	abstract protected Map retrieveParameters(HttpServletRequest request) throws Exception;
	/**
	 * 
	 * Adapta la entrada en una salida que se corresponde con la operacion a realizar.
	 * @param input
	 * @param operation
	 * @return
	 */
	abstract protected Map adaptParameters(Object input, IEventBusiness operation) throws ClassNotFoundException, InstantiationException, IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException, Exception;
	
	
}
