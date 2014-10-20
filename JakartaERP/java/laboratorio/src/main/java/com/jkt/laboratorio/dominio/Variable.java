package com.jkt.laboratorio.dominio;

import com.jkt.dominio.Descriptible;

public class Variable extends Descriptible {
	Metodo metodo;

	public Metodo getMetodo() {
		return metodo;
	}

	public void setMetodo(Metodo aValue) {
		this.metodo = aValue;
	}

}
