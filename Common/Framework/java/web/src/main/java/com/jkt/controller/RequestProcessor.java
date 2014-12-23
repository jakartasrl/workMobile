package com.jkt.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jkt.contexto.ApplicationContext;
import com.jkt.dominio.Container;
import com.jkt.excepcion.EntityNotFoundException;
import com.jkt.excepcion.JakartaException;
import com.jkt.operaciones.Operation;
import com.jkt.persistencia.IServiceRepository;
import com.jkt.request.EventBusiness;
import com.jkt.request.IEventBusiness;
import com.jkt.service.SessionProvider;
import com.jkt.transformers.Transformer;
import com.jkt.util.IRepositorioClases;
import com.jkt.xmlreader.ElementTransformer;
import com.jkt.xmlreader.Output;
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
	
	protected static final String CLIENTE_DELPHI= "DELPHI";
	protected static final String CLIENTE_HTML = "HTML";
	
	private static final String OUTPUT_DATASET_NAME = "outputDatasetName";

	@Autowired
	protected IRepositorioClases repositorioClases;
	
	@Autowired
	protected SessionProvider sessionProvider;
	protected boolean test;
	
	@Autowired
	protected IServiceRepository serviceRepository;
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private ApplicationContext applicationContext;
	protected IEventBusiness eventBusinessOperation;

	public ServletContext getServletContext() {
		return servletContext;
	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

		
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/xml", method = RequestMethod.POST)
	public void handleXML(HttpServletRequest request, HttpServletResponse response)throws Exception,EntityNotFoundException {

		String ip = request.getRemoteAddr();// IP del cliente
		String host = request.getRemoteHost();// Host del cliente

		
		log.debug(String.format("Procesando una solicitud desde el cliente %s con direccion IP %s",host, ip));
		
		setResponse(response);//setea el writer para cuando el controller sea notificado sepa donde escribir la respuesta.
		
		log.debug(String.format("Se inicia una solicitud desde un cliente %s.",getAppRequest()));
		
		String operationName="";
		Map parameters;
	
		try{
			if(getAppRequest().equals(CLIENTE_HTML)){
				parameters=getParameters(request, operationName);
			}else{
				parameters=getParameters(request, operationName);
			}
		}catch(Exception e){
			throw new JakartaException("Error al querer levantar el map de parametros");
		}
		if (eventBusinessOperation==null) {
			finalizar(operationName);
		}
		
		Operation operation=recuperarOperacion(eventBusinessOperation);
		if (operation==null) {
			finalizar(operationName);
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
		
		log.debug("Adaptando la entrada de parametros de acuerdo a la operación solicitada...");
		parametersAdapted = adaptParameters(parameters, eventBusinessOperation);

		try{
		String entidad = ((EventBusiness) eventBusinessOperation).getEntidad();
		if (entidad!=null && !entidad.isEmpty()) {
			log.debug("No existen parametros de entrada. Se toma como filtro una entidad...");
//			parametersAdapted = new HashMap<String, String>();
			parametersAdapted.put("entidad", entidad);
		}
		

		log.debug("Recuperando un transformer para la operación actual...");
		if( ((EventBusiness) eventBusinessOperation).getTransformer()==null &&  getAppRequest().equals(CLIENTE_HTML)){
			ElementTransformer elemTrans=new ElementTransformer();
			elemTrans.setClase("com.jkt.transformers.WebTransformer");
			 ((EventBusiness) eventBusinessOperation).setTransformer(elemTrans);
		}
		Transformer transformer = operation.generateTransformer(getOutputStream(), (EventBusiness) eventBusinessOperation, (String)parametersAdapted.get(OUTPUT_DATASET_NAME.toUpperCase()));
		transformer.setTest(test);
		log.debug("Ejecutando la operaci�n...");
		if (test){
			parametersAdapted = getObjetosOutput(operation, eventBusinessOperation );
		}

		operation.runOperation(parametersAdapted);

		
		log.debug("Enviando resultados de la operaci�n...");
		transformer.write();
		
		}finally{
			sessionProvider.destroySession();
		}
		log.debug("Finaliz� la operaci�n...");
	}

	protected void getEventBusinessOperation(String operationName) {
		log.debug("Ejecutando la operaci�n "+operationName+".");
		eventBusinessOperation = getOperation(operationName);
	}
	
	/**
	 * Metodo a implementar sobre el cual se obtiene el nombre de la operacion y el mapa con los parametros
	 * segun corresponda 
	 * 
	 * @param request
	 * @param operationName
	 * @return
	 * @throws Exception
	 */
	public abstract Map getParameters(HttpServletRequest request,String operationName) throws Exception;

	private Map<String, Object> getObjetosOutput(Operation aOper,	IEventBusiness aEB) {
		Map<String, Object> res = new HashMap<String, Object>();
		Iterator<Output> it = aEB.getOutputs().iterator();
		while (it.hasNext()){
			Output out = (Output) it.next();
			res.put(out.getName(),new Container("Prueba"));
		}
		return res;
	}

	/**
	 * Recupera el nombre de la operacion e instancia la operacion propiamente dicha.
	 * 
	 */
	private Operation recuperarOperacion(IEventBusiness eventBusinessOperation) throws InstantiationException, IllegalAccessException, ClassNotFoundException, JakartaException {
		String clase = ((EventBusiness)eventBusinessOperation).getClase();
		if (test){
			clase="com.jkt.operaciones.OperacionTest";
		}
		Class<?> forName = null;
		try{
		   forName = Class.forName(clase);
		}
		catch (ClassNotFoundException e){
			throw new JakartaException("La clase " + clase + " no existe");
		}
		Object newInstance = forName.newInstance();
		Operation op=(Operation)newInstance;
		op.setServiceRepository(serviceRepository);
		op.setSessionProvider(sessionProvider);
		op.setRepositorioClases(repositorioClases);
		
		//Seteo el eventBusiness solamente si es cliente delphi, xq all� se usa informacion como por ejemplo la de las listas <listas><lista/></listas>
		if (getAppRequest().equals(CLIENTE_DELPHI)) {
			op.setEventBusiness(eventBusinessOperation);
		}
		
		return op;
	}

	/**
	 * Finaliza si la operacion no existe.
	 * 
	 * @throws JakartaException Siempre que se ejecute este metodo se levanta la excepcion.
	 */
	private void finalizar(String aOperName) throws JakartaException {
		log.debug("La operaci�n " + aOperName + " no existe en operaciones.xml .Se finaliza la petici�n.");
		throw new JakartaException("La operaci�n " + aOperName + " no existe en operaciones.xml .Se finaliza la petici�n.");
	}

	/**
	 * Recupera una operacion
	 * 
	 * @param operationName
	 * @return
	 */
	protected IEventBusiness getOperation(String operationName){
		
		/*
		 * Al momento de querer recuperar la operacion, diferencio entre clientes.
		 * Consulto de quien viene el request y solicito al context el correspondiente hijo.
		 * 
		 */
		XMLEntity hijo;
		if (getAppRequest().equals(CLIENTE_DELPHI)) {
			hijo = (XMLEntity) applicationContext.retrieveBusinessObjectForDelphi().getHijo(operationName);
		}else{
			hijo = (XMLEntity) applicationContext.retrieveBusinessObjectForHTMLClient().getHijo(operationName);
		}
		
		return (IEventBusiness) hijo;
	}
	

	public ApplicationContext getApplicationContext() {
		return applicationContext;
	}

	public void setApplicationContext(ApplicationContext applicationContext) {
		this.applicationContext = applicationContext;
	}
	
	
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
