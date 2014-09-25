package com.jkt.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintStream;

import javax.servlet.ServletOutputStream;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jkt.excepcion.EntityNotFoundException;
import com.jkt.excepcion.ExceptionDS;
import com.jkt.excepcion.ExceptionValidacion;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionException;
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
public class BaseController{

	private ServletOutputStream outputStream;

	public ServletOutputStream getOutputStream() {
		return outputStream;
	}
	
	public void setOutputStream(ServletOutputStream outputStream) {
		this.outputStream = outputStream;
	}

	
	@ExceptionHandler(ExceptionDS.class)
	public @ResponseBody void manejarExcepcionJakarta(ExceptionDS exceptionDS) throws IOException{
		outputStream.flush();
		XMLStreamMaker xmlStreamMaker = new XMLStreamMaker();
		xmlStreamMaker.setStream(outputStream);
		xmlStreamMaker.writeStartTagException(exceptionDS.getMessage());
	}
	
	
	@ExceptionHandler(EntityNotFoundException.class)
	public @ResponseBody void manejarEntityNotFoundException(EntityNotFoundException e) throws IOException{
		outputStream.flush();
		XMLStreamMaker xmlStreamMaker = new XMLStreamMaker();
		xmlStreamMaker.setStream(outputStream);
		xmlStreamMaker.writeStartTagException(e.getMessage());
	}

	@ExceptionHandler(ValidacionException.class)
	public @ResponseBody void manejarValidacionException(ValidacionException e) throws IOException{
		outputStream.flush();
		XMLStreamMaker xmlStreamMaker = new XMLStreamMaker();
		xmlStreamMaker.setStream(outputStream);
		xmlStreamMaker.writeStartTagException(e.getMessage());
	}
	
	@ExceptionHandler(LoginException.class)
	public @ResponseBody void manejarLoginException(LoginException loginException) throws IOException{
		outputStream.flush();
		XMLStreamMaker xmlStreamMaker = new XMLStreamMaker();
		xmlStreamMaker.setStream(outputStream);
		xmlStreamMaker.writeStartTagException(loginException.getMessage());
	}
	
	@ExceptionHandler(RuntimeException.class)
	public @ResponseBody void manejarExcepcionJakarta(RuntimeException runtimeException) throws IOException{
		XMLStreamMaker xmlStreamMaker = new XMLStreamMaker();
		xmlStreamMaker.setStream(outputStream);
		
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		PrintStream ps = new PrintStream(out);
				  
		runtimeException.printStackTrace();
		runtimeException.printStackTrace(ps);
				  
		xmlStreamMaker.writeStartTagException(out.toString());
	} 
	
	@ExceptionHandler(ExceptionValidacion.class)
	public @ResponseBody StackTraceElement[] manejarExcepcionJakarta(ExceptionValidacion exceptionDS){
		return exceptionDS.getStackTrace();
	} 
	
	@ExceptionHandler(Exception.class)
	public @ResponseBody void manejarExcepcionJakarta(Exception exception) throws IOException{
		outputStream.flush();
		XMLStreamMaker xmlStreamMaker = new XMLStreamMaker();
		xmlStreamMaker.setStream(outputStream);
		xmlStreamMaker.writeStartTagException(exception.getMessage());
	} 

	@ExceptionHandler(JakartaException.class)
	public @ResponseBody void manejarExcepcionJakarta(JakartaException exception) throws IOException{
		outputStream.flush();
		XMLStreamMaker xmlStreamMaker = new XMLStreamMaker();
		xmlStreamMaker.setStream(outputStream);
		xmlStreamMaker.writeStartTagException(exception.getMessage());
	} 
	
	@ExceptionHandler(org.hibernate.TransactionException.class)
	public @ResponseBody void manejarExcepcionDeTransacciones(org.hibernate.TransactionException exception) throws IOException{
		outputStream.flush();
		XMLStreamMaker xmlStreamMaker = new XMLStreamMaker();
		xmlStreamMaker.setStream(outputStream);
		xmlStreamMaker.writeStartTagException("Esperé mientras se termina una operación pendiente...Vuelva a intentar en breves segundos.");
	} 
	
}
