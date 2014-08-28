package com.jkt.varios.dominio;

import com.jkt.dominio.Descriptible;

/**
 * <p> Representa una clasificacion de cualquier entidad "Clasificable" </p>
 * 
 * <p> Trabaja como una metaclase que define a los clasificadores de una entidad </p>
 * 
 * <p> Se utilizará para poder clasificar de distintas maneras a los objetos de las entidades clasificables </p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Clasificador extends Descriptible {

	private static final long serialVersionUID = 1L;

	private String entidad;

	/*
	 * Es el componente de level cero?
	 */
	private Componente componentePadre;

	public String getEntidad() {
		return entidad;
	}

	public void setEntidad(String entidad) {
		this.entidad = entidad;
	}

	public Componente getComponentePadre() {
		return componentePadre;
	}

	public void setComponentePadre(Componente componentePadre) {
		this.componentePadre = componentePadre;
	}

}
