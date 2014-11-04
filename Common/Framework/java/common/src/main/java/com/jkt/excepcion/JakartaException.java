package com.jkt.excepcion;

/**
 * 
 * Excepcion generica para manejar errores de todo tipo.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class JakartaException extends Exception {

	/**
	 * Constructor por defecto
	 * 
	 * @param msg
	 */
	public JakartaException(String string) {
		super(string);
	}

	public JakartaException(String string,Exception e) {
		super(string,e);
	}
	
}
