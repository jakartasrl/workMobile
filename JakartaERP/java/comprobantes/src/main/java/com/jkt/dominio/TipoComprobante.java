package com.jkt.dominio;

/**
 * Representa al tipo de un comprobante. Cada instancia de esta clase, son los
 * posibles tipos.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TipoComprobante extends PersistentEntity {

	private String descripcion;

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

}
