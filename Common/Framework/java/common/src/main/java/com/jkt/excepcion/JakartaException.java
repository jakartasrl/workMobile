package com.jkt.excepcion;

/**
 * 
 * Excepcion generica para manejar errores de todo tipo.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class JakartaException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6100128085457654335L;

	/**
	 * Constructor por defecto
	 * 
	 * @param msg
	 */
	public JakartaException(String string) {
		super(string);
	}

}
