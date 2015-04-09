package com.jkt.laboratorio.dominio;

import com.jkt.dominio.Descriptible;

public class Variable extends Descriptible {
	
	private Determinacion determinacion;
	private Expresion           expresion;
	
	public Determinacion getDeterminacion() {
		return determinacion;
	}
	public void setDeterminacion(Determinacion determinacion) {
		this.determinacion = determinacion;
	}
	public Expresion getExpresion() {
		return expresion;
	}
	public void setExpresion(Expresion expresion) {
		this.expresion = expresion;
	}
	
}
