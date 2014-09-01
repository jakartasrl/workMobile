package com.jkt.dominio;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * Sirve para las entidades que contienen los campos codigo y descripcion.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Descriptible extends PersistentEntity {

	private static final long serialVersionUID = -6218376283846355915L;
	
	@NotNull(message="El campo codigo no puede ser nulo.")
	@NotEmpty(message="El campo codigo no puede estar vacio.")
	private String codigo;
	
	@NotEmpty(message="La descripción no debe estar vacia.")
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
