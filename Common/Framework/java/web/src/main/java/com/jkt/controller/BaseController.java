package com.jkt.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;
import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jkt.excepcion.EntityNotFoundException;
import com.jkt.excepcion.ExceptionDS;
import com.jkt.excepcion.ExceptionValidacion;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.exception.LoginException;
import com.jkt.framework.writers.XMLStreamMaker;

/**
 * 
 * Controller padre de todos los demas.
 * 
 * <h1>Algunas de las funcionalidades de esta clase</h1>
 * <p>Manejo de excepciones</p>
 * <p>Funcionalidad comun entre todos los controllers</p>
 * <p>Inyecci�n de dependencia de todos los controladores en comun, por ejemplo, el servletContext</p>
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public abstract class BaseController{
	
	protected static final Logger log = Logger.getLogger(RequestProcessor.class);
	
	protected static final String CLIENTE_DELPHI= "DELPHI";
	protected static final String CLIENTE_HTML = "HTML";
	protected static final String MSJ_ERROR_DEFAULT="Error inesperado";
	
	private HttpServletResponse response;

	/*
	 * Methods that must be will implemented.
	 */
	abstract protected String getAppRequest();

	
	public ServletOutputStream getOutputStream() {
		try {
			return response.getOutputStream();
		} catch (IOException e) {
			throw new RuntimeException("ERror al leer outputstream del response",e);
		}
	}

	public HttpServletResponse getResponse() {
		return response;
	}


	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	
	
	public void manejoExcepcionPorOrigen(String error) throws IOException{
		manejoExcepcionPorOrigen(error, null);
	}
	
	private void manejoExcepcionPorOrigen(Exception exception) throws IOException {
		manejoExcepcionPorOrigen(exception.getMessage(),ExceptionUtils.getFullStackTrace(exception));
	}

	
	public void manejoExcepcionPorOrigen(String error,String descripcion) throws IOException{
		if(CLIENTE_DELPHI.equals(getAppRequest())){
			response.getOutputStream().flush();
			XMLStreamMaker xmlStreamMaker = new XMLStreamMaker();
			xmlStreamMaker.setStream(response.getOutputStream());
			xmlStreamMaker.writeStartTagException(error);
		}else{
			response.setStatus(Response.SC_INTERNAL_SERVER_ERROR);
			Gson gson = new GsonBuilder().create();
			//lo paso en formato json para que tome los \n
			response.addHeader("error", gson.toJson(error));
			if(descripcion!=null && !descripcion.isEmpty()){
				getOutputStream().write(descripcion.getBytes());
				getOutputStream().flush();
				getOutputStream().close();
			}
		}
	}
	
	@ExceptionHandler(ExceptionDS.class)
	public @ResponseBody void manejarExcepcionJakarta(ExceptionDS exceptionDS) throws IOException{
		manejoExcepcionPorOrigen(exceptionDS);
		log.error(ExceptionUtils.getFullStackTrace(exceptionDS));
	}
	
	


	@ExceptionHandler(EntityNotFoundException.class)
	public void manejarEntityNotFoundException(EntityNotFoundException e) throws IOException{
		manejoExcepcionPorOrigen(e);
		log.error(ExceptionUtils.getFullStackTrace(e));
	}

	@ExceptionHandler(ValidacionDeNegocioException.class)
	public void manejarValidacionException(ValidacionDeNegocioException e) throws IOException{
		manejoExcepcionPorOrigen(e);
		log.error(ExceptionUtils.getFullStackTrace(e));
	}
	
	@ExceptionHandler(LoginException.class)
	public  void manejarLoginException(LoginException loginException) throws IOException{
		manejoExcepcionPorOrigen(loginException);
		log.error(ExceptionUtils.getFullStackTrace(loginException));

	}
	
	@ExceptionHandler(RuntimeException.class)
	public  void manejarExcepcionJakarta(RuntimeException runtimeException) throws IOException{
		log.error(ExceptionUtils.getFullStackTrace(runtimeException));
		if(CLIENTE_DELPHI.equals(getAppRequest())){
			XMLStreamMaker xmlStreamMaker = new XMLStreamMaker();
			xmlStreamMaker.setStream(response.getOutputStream());
			
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			PrintStream ps = new PrintStream(out);
					  
			runtimeException.printStackTrace();
			runtimeException.printStackTrace(ps);
					  
			xmlStreamMaker.writeStartTagException(out.toString());
		}else{
			response.setStatus(Response.SC_INTERNAL_SERVER_ERROR);
			manejoExcepcionPorOrigen(runtimeException);
//			getOutputStream().write(ExceptionUtils.getFullStackTrace(runtimeException).getBytes());
//			getOutputStream().flush();
		}

	} 
	
	@ExceptionHandler(ExceptionValidacion.class)
	public @ResponseBody StackTraceElement[] manejarExcepcionJakarta(ExceptionValidacion exceptionDS){
		log.error(ExceptionUtils.getFullStackTrace(exceptionDS));

		return exceptionDS.getStackTrace();
		
	} 
	
	@ExceptionHandler(Exception.class)
	public void manejarExcepcionJakarta(Exception exception) throws IOException{
		manejoExcepcionPorOrigen(exception);
		log.error(ExceptionUtils.getFullStackTrace(exception));

	} 

	@ExceptionHandler(JakartaException.class)
	public void manejarExcepcionJakarta(JakartaException exception) throws IOException{
		manejoExcepcionPorOrigen(exception.getMessage(),exception.getDescripcion());
		log.error(ExceptionUtils.getFullStackTrace(exception));

	} 
	
	@ExceptionHandler(org.hibernate.TransactionException.class)
	public void manejarExcepcionDeTransacciones(org.hibernate.TransactionException exception) throws IOException{
		manejoExcepcionPorOrigen("Esperé mientras se termina una operación pendiente...Vuelva a intentar en breves segundos.");
		log.error(ExceptionUtils.getFullStackTrace(exception));
	} 
	
}
