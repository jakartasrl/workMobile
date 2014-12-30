package com.jkt.dominio.entidades.xml;

/**
 * Validador que representa a los validadores para el ABM generico
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class Validador {

	private String fieldName, tipoValidacion, entidad, oidName, descrName;

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getTipoValidacion() {
		return tipoValidacion;
	}

	public void setTipoValidacion(String tipoValidacion) {
		this.tipoValidacion = tipoValidacion;
	}

	public String getEntidad() {
		return entidad;
	}

	public void setEntidad(String entidad) {
		this.entidad = entidad;
	}

	public String getOidName() {
		return oidName;
	}

	public void setOidName(String oidName) {
		this.oidName = oidName;
	}

	public String getDescrName() {
		return descrName;
	}

	public void setDescrName(String descrName) {
		this.descrName = descrName;
	}

}
