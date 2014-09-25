package com.jkt.exception;

import com.jkt.excepcion.JakartaException;

/**
 * Excepcion que es ejecutada/levantada/lanzada cuando ocurre un acceso incorrecto al sistema.
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class LoginException extends JakartaException {

	private static final String MESSAGE = "El acceso no fue garantizado.";

	public LoginException(String string) {
		super(string);
	}
	
	public LoginException(){
		super(MESSAGE);
	}

}
