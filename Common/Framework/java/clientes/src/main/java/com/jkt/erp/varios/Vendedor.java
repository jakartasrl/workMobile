package com.jkt.erp.varios;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import com.jkt.dominio.PersistentEntity;

/**
 * Entidad que representa a un vendedor
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Vendedor extends PersistentEntity {

	private static final long serialVersionUID = -6026853125242306297L;

	@NotBlank(message="No puede estar vacio el codigo.")
	private String codigo;

	@NotBlank(message="Debe completar el nombre del usuario.")
	private String nombres;

	@NotBlank(message="Debe completar el apellido de usuario.")
	private String apellido;
	
	@Email(message="El correo ingresado no parece tener el formato correcto.")
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
