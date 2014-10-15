package com.jkt.laboratorio.dominio;

import com.jkt.dominio.PersistentEntity;

/**
 * Representa las determinaciones que componen un  Análisis que se puede hacer en un Laboratorio.
 * Se utiliza en los pedidos de Laboratorio y en los protocolos.
 * Ejemplo: Análisis físico-químico de un transformador.
 */
public class AnalisisDet extends PersistentEntity{
	private Analisis      analisis;
	private Determinacion determinacion;

	/* -------------------------------------- Getters & Setters -------------------------------------- */
	public Analisis getAnalisis() {
		return analisis;
	}

	public void setAnalisis (Analisis  aValue) {
		this.analisis = aValue;
	}

	public Determinacion getDeterminacion() {
		return determinacion;
	}

	public void setDeterminacion (Determinacion  aValue) {
		this.determinacion = aValue;
	}



}
