package com.jkt.view;

import java.io.Serializable;

public abstract class ObjectView implements Serializable {

	private long id;
	private String nameOV;// Key para cando tenga mas de 2 input/envie 2 OV para una misma operacion
	private Boolean activo;

	public void setId(long id) {
		this.id = id;
	}
	
	public Long getId() {
		return id;
	}

	public Boolean getActivo() {
		return activo;
	}

	public void setActivo(Boolean activo) {
		this.activo = activo;
	}


	public void setId(Long id) {
		this.id = id;
	}

	public String getNameOV() {
		return nameOV;
	}

	public void setNameOV(String nameOV) {
		this.nameOV = nameOV;
	}
}
