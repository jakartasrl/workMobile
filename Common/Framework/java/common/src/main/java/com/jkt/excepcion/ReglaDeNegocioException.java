package com.jkt.excepcion;

public class ReglaDeNegocioException extends JakartaException {

	private static final String MESSAGE = "Regla de negocio: La entidad no es consitente con la lógica de negocio declarada.";

	public ReglaDeNegocioException(String string) {
		super(string);
	}
	
	public ReglaDeNegocioException() {
		super(MESSAGE);
	}

	private static final long serialVersionUID = 1L;

}
