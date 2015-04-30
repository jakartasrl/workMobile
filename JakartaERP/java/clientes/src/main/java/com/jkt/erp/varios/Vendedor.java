package com.jkt.erp.varios;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import com.jkt.dominio.IDescriptible;
import com.jkt.dominio.PersistentEntity;

/**
 * Entidad que representa a un vendedor
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Vendedor extends PersistentEntity implements IDescriptible {

	@NotBlank(message="No puede estar vacio el codigo de vendedor.")
	private String codigo;

	@NotBlank(message="Debe completar el nombre del vendedor.")
	private String nombres;

	@NotBlank(message="Debe completar el apellido de vendedor.")
	private String apellido;
	
	@Email(message="El correo ingresado para el vendedor no parece tener el formato correcto.")
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

	public String getDescripcion() {
		return apellido + ","  + nombres;
	}

	public String getAdicional1() {
		return null;
	}

	public String getAdicional2() {
		return null;
	}

}
