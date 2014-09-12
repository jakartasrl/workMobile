package com.jkt.excepcion;

public class ValidacionException extends Exception {

	private static final String MESSAGE = "Regla de negocio: La entidad no es consitente con la l�gica de negocio declarada.";

	public ValidacionException(String message) {
		super(message);
	}
	
	public ValidacionException() {
		super(MESSAGE);
	}

}
