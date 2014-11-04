package com.jkt.excepcion;

public class ValidacionDeNegocioException extends Exception {

	private static final String MESSAGE = "Validacion: La entidad no es consitente con la l�gica de negocio declarada.";

	public ValidacionDeNegocioException(String message) {
		super(message);
	}
	
	public ValidacionDeNegocioException() {
		super(MESSAGE);
	}

}
