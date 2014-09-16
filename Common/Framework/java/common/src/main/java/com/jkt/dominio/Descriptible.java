package com.jkt.dominio;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

/**
 * Sirve para las entidades que contienen los campos codigo y descripcion.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Descriptible extends PersistentEntity {

	@NotNull(message="El campo codigo no puede ser nulo.")
	@NotBlank(message="El campo codigo no puede estar vacio.")
	private String codigo;
	
	@NotBlank(message="La descripción no debe estar vacia.")
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
