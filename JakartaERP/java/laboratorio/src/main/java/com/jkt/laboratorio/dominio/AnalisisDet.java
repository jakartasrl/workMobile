package com.jkt.laboratorio.dominio;

import com.jkt.dominio.PersistentEntity;

public class AnalisisDet extends PersistentEntity {

	private Analisis analisis;
	private Determinacion determinacion;

	public Analisis getAnalisis() {
		return analisis;
	}

	public void setAnalisis(Analisis analisis) {
		this.analisis = analisis;
	}

	public Determinacion getDeterminacion() {
		return determinacion;
	}

	public void setDeterminacion(Determinacion determinacion) {
		this.determinacion = determinacion;
	}

}
