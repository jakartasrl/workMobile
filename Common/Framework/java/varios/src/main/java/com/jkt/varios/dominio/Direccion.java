package com.jkt.varios.dominio;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

import com.jkt.dominio.PersistentEntity;

/**
 * <p>Representa un tipo de datos "Direccion".</p>
 * <p>Se utilizará para guardar cualquier dirección de cualquier entidad(cliente, proveedor, banco, etc).</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Direccion extends PersistentEntity {
	
	private static final long serialVersionUID = -8514592739178919248L;

	@NotBlank
	private String nombre;

	@NotBlank
	private String direccion;

	@NotBlank
	private String codigoPostal;

	@NotBlank
	private String localidad;

	@NotNull
	private Provincia provincia;

	@NotNull
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
