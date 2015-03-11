package com.jkt.common;

public class ServletException extends RuntimeException {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String descripcion;

	
	
	public ServletException(String message) {
		super(message);
	}

	public ServletException(String msg,String descripcion) {
		super(msg);
		this.descripcion = descripcion;
	}

	public String getDescripcion() {
		return descripcion;
	}
}
