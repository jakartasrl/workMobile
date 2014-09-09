package com.jkt.erp.varios;

import org.hibernate.validator.constraints.NotBlank;

import com.jkt.dominio.PersistentEntity;

/**
 * Entidad que representa la información de contacto
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Contacto extends PersistentEntity {

	private static final long serialVersionUID = -4756046333804262702L;

	@NotBlank
	private String apellido;
	
	@NotBlank
	private String nombre;
	
	@NotBlank
	private String telefono;
	
	@NotBlank
	private String mail;

	@NotBlank
	private String tratamiento;

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getTratamiento() {
		return tratamiento;
	}

	public void setTratamiento(String tratamiento) {
		this.tratamiento = tratamiento;
	}

}
