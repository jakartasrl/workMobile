package com.jkt.excepcion;

public class ValidacionDeNegocioException extends Exception {

	private static final String MESSAGE = "Validacion: La entidad no es consitente con la logica de negocio declarada.";

	public ValidacionDeNegocioException(String message) {
		super(message);
	}
	
	public ValidacionDeNegocioException() {
		super(MESSAGE);
	}

	public ValidacionDeNegocioException(String msg, Exception e) {
		super(msg, e);
	}

}
