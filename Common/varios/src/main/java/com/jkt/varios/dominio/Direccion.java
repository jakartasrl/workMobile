package com.jkt.varios.dominio;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

import com.jkt.dominio.PersistentEntity;

/**
 * <p>Representa un tipo de datos "Direccion".</p>
 * <p>Se utilizaría para guardar cualquier dirección de cualquier entidad(cliente, proveedor, banco, etc).</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Direccion extends PersistentEntity {
	
//	@NotBlank(message="El nombre de la direccion no puede ser vacio.")
	private String nombre="";

	@NotBlank(message="La direccion no debe estar vacia.")
	private String direccion;

	@NotBlank(message="El codigo postal no puede estar vacio.")
	private String codigoPostal;

	@NotBlank(message="La localidad no puede estar vacia.")
	private String localidad;

	@NotNull(message="La provincia no puede ser nula.")
	private Provincia provincia;

	@NotNull(message="El pais no puede ser nulo.")
	private Pais pais;

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getCodigoPostal() {
		return codigoPostal;
	}

	public void setCodigoPostal(String codigoPostal) {
		this.codigoPostal = codigoPostal;
	}

	public String getLocalidad() {
		return localidad;
	}

	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}

	public Provincia getProvincia() {
		return provincia;
	}

	public void setProvincia(Provincia provincia) {
		this.provincia = provincia;
	}

	public Pais getPais() {
		return pais;
	}

	public void setPais(Pais pais) {
		this.pais = pais;
	}

}
