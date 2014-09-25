package com.jkt.erp.varios;

import com.jkt.dominio.Descriptible;

/**
 * Entidad Representante
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Representante extends Descriptible {

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
