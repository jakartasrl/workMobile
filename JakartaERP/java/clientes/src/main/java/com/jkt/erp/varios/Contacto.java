package com.jkt.erp.varios;

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
	private String apellido;
	
	@NotBlank
	private String nombre;
	
	@NotBlank
	private String telefono;
	
	@NotBlank
	@Email(message="El correo ingresado no parece tener el formato correcto.")
	private String mail;

	@NotBlank
	private String tratamiento;

	//Transient var for not persist in db
	private long clienteSucursalId;
	
	public long getClienteSucursalId() {
		return clienteSucursalId;
	}

	public void setClienteSucursalId(long clienteSucursalId) {
		this.clienteSucursalId = clienteSucursalId;
	}

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

	public void setClienteSucursal(long id) {
		this.clienteSucursalId=id;
	}

}
