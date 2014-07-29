package com.jkt.dominio;

/**
 * Sirve para las entidades que contienen los campos codigo y descripcion.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Descriptible extends PersistentEntity {

	private String codigo;
	private String descripcion;

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

}
