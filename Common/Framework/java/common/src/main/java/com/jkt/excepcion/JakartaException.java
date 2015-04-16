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
	private String descripcion;
	
	public JakartaException(String string) {
		super(string);
	}

	public JakartaException(String string,String desc) {
		super(string);
		this.descripcion=desc;
	}

	public JakartaException(String string,Exception e) {
		super(string);
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
}
