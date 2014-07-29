package com.jkt.dominio;

/**
 * Wrapper de un simple texto. xq no usaste solo la clase string, xq como estan hechas
 * las cosas, solo se permiten persistentEntities.
 * 
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class Container extends PersistentEntity {

//	private String nombreEntidad;
//
//	public String getNombreEntidad() {
//		return nombreEntidad;
//	}
//
//	public void setNombreEntidad(String nombreEntidad) {
//		this.nombreEntidad = nombreEntidad;
//	}
	
	private String value;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	public Container(String value) {
		this.value=value;
	}

}
