package com.jkt.varios.dominio;

import com.jkt.dominio.Descriptible;

/**
 * <p>Representa a un componente de un {@link Clasificador}</p>
 * <p>Se utilizará para poder clasificar de distintas aneras a los objetos de las entidades clasificables</p>
 * <p>Un mismo componente puede estar en 2 clasificadores distintos</p>
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Componente extends Descriptible {

	private static final long serialVersionUID = 4380535438348190104L;

	private Clasificador clasificador;
	private Componente componentePadre;
	private Componente componenteHijo;

	public Clasificador getClasificador() {
		return clasificador;
	}

	public void setClasificador(Clasificador clasificador) {
		this.clasificador = clasificador;
	}

	public Componente getComponentePadre() {
		return componentePadre;
	}

	public void setComponentePadre(Componente componentePadre) {
		this.componentePadre = componentePadre;
	}

	public Componente getComponenteHijo() {
		return componenteHijo;
	}

	public void setComponenteHijo(Componente componenteHijo) {
		this.componenteHijo = componenteHijo;
	}

}
