package com.jkt.dominio;

import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import org.hibernate.validator.constraints.Range;


/**
 * TODO user annotation entity for persist.
 * 
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Factura extends PersistentEntity {

	@NotNull
	private String nombre;
	
	@NotNull
	private String fecha;
	
	@Range(max=2000, min=0, message="Error en el codigo postal.")
	private Integer codigoPostal;
	
	private Descripcion descripcion;

	public Descripcion getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(Descripcion descripcion) {
		this.descripcion = descripcion;
	}

	public Integer getCodigoPostal() {
		return codigoPostal;
	}

	public void setCodigoPostal(Integer codigoPostal) {
		this.codigoPostal = codigoPostal;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

}
