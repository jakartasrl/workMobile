package com.jkt.laboratorio.dominio;

import com.jkt.dominio.Descriptible;

public class Variable extends Descriptible {
	Determinacion determinacion;

	public Determinacion getDeterminacion() {
		return determinacion;
	}

	public void setDeterminacion(Determinacion aValue) {
		this.determinacion = aValue;
	}

}
