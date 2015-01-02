package com.jkt.laboratorio.dominio;

import com.jkt.dominio.Descriptible;

/**
 * Representa un An�lisis que se puede hacer en un Laboratorio.
 * Se utiliza en los pedidos de Laboratorio y en los protocolos.
 * Ejemplo: An�lisis f�sico-qu�mico de un transformador.
 */
public class Diagnostico extends Descriptible {

	/**
	 * Tipo de Laboratorio al que pertenece
	 */
	private Laboratorio laboratorio;

	
	/* -------------------------------------- Getters & Setters -------------------------------------- */
	public Laboratorio getLaboratorio() {
		return laboratorio;
	}

	public void setLaboratorio(Laboratorio laboratorio) {
		this.laboratorio = laboratorio;
	}

}
