package com.jkt.erp.varios;

import com.jkt.dominio.PersistentEntity;

/**
 * Entidad que representa a un vendedor
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Vendedor extends PersistentEntity {

	private static final long serialVersionUID = -6026853125242306297L;

	private String codigo;
	private String nombres;
	private String apellido;
	private String mail;
	private String telefono;

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

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
