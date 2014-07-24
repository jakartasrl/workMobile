package com.jkt.dominio;

/**
 * Entidad de ejemplo...
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Descripcion extends PersistentEntity {

	private String descripcion;
	private Fecha fecha;
	
	public Fecha getFecha() {
		return fecha;
	}

	public void setFecha(Fecha fecha) {
		this.fecha = fecha;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	

}
