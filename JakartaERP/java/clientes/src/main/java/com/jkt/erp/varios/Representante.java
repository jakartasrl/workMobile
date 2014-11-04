package com.jkt.erp.varios;

import org.hibernate.validator.constraints.Email;

import com.jkt.dominio.Descriptible;

/**
 * Entidad Representante
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Representante extends Descriptible {

	@Email(message="Compruebe el formato de correo del representante.")
	private String mail;
	
	private String telefono;

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

}
