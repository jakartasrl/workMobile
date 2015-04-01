package com.jkt.varios.dominio;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import com.jkt.dominio.PersistentEntity;

/**
 * Entidad que representa la informaci�n de contacto
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Contacto extends PersistentEntity {

	@NotBlank
	private String apellidoYNombre;

	@NotBlank(message="Falta completar telefono de Contacto")
	private String telefono;

	private String telefonoAlternativo;

	private String celular;

//	@NotBlank(message="Debe ingresar un correo electronico.")
	@Email(message = "El correo ingresado no parece tener el formato correcto.")
	private String mail;

	@NotBlank(message="Falta completar el Cargo del Contacto")
	private String tratamiento;

	@NotNull(message="El contacto debe tener obligatoriamente un tipo de contacto.")
	private TipoContacto tipoContacto;
	
	public TipoContacto getTipoContacto() {
		return tipoContacto;
	}

	public void setTipoContacto(TipoContacto tipoContacto) {
		this.tipoContacto = tipoContacto;
	}

	// Transient var for not persist in db
	private long clienteSucursalId;

	public long getClienteSucursalId() {
		return clienteSucursalId;
	}

	public void setClienteSucursalId(long clienteSucursalId) {
		this.clienteSucursalId = clienteSucursalId;
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

	public void setClienteSucursal(long id) {
		this.clienteSucursalId = id;
	}

	public String getApellidoYNombre() {
		return apellidoYNombre;
	}

	public void setApellidoYNombre(String apellidoYNombre) {
		this.apellidoYNombre = apellidoYNombre;
	}

	public String getTelefonoAlternativo() {
		return telefonoAlternativo;
	}

	public void setTelefonoAlternativo(String telefonoAlternativo) {
		this.telefonoAlternativo = telefonoAlternativo;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	
	/*
	 * Helper methods para no crear una nueva operacion
	 */
	
	public String getCodigo(){
		return this.apellidoYNombre;
	}
	public String getDescripcion(){
		return this.telefono;
	}
}
