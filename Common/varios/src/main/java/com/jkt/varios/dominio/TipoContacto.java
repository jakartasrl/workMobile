package com.jkt.varios.dominio;

import org.hibernate.validator.constraints.NotBlank;

import com.jkt.dominio.PersistentEntity;

/**
 * <p>Un {@link Contacto} tiene referencia a un tipo de contacto.</p>
 * <p>Define tipos de contacto, y en su defecto puede representar comportamientos diferentes.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TipoContacto extends PersistentEntity {

	@NotBlank(message="El tipo de contacto debe tener un nombre.")
	private String nombre;
	private String descripcion;

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public String getCodigo(){
		return nombre;
	}

}
