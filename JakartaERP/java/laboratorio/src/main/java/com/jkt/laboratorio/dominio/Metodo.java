package com.jkt.laboratorio.dominio;

import java.util.ArrayList;
import java.util.List;

import com.jkt.dominio.PersistentEntity;

public class Metodo extends PersistentEntity {
	private Determinacion 		determinacion;
	private String        		metodo;
	private Expresion           expresion;
	
	
	
	public Expresion getExpresion() {
		return expresion;
	}


	public void setExpresion(Expresion expresion) {
		this.expresion = expresion;
	//	expresion.setMetodo(this);
	}

	private List<ValorEsperado> valoresEsperados = new ArrayList<ValorEsperado>();
	

	public Determinacion getDeterminacion() {
		return determinacion;
	}


	public void setDeterminacion(Determinacion determinacion) {
		this.determinacion = determinacion;
	}


	public String getMetodo() {
		return metodo;
	}


	public void setMetodo(String metodo) {
		this.metodo = metodo;
	}


	public String getExpresionResultado() {
		return expresion.getExpresion();
	}


	public void setExpresionResultado(String aValue) {
		expresion = getExpresion();
		if (expresion == null){
			expresion = new Expresion();
		}
		expresion.setExpresion(aValue);
		expresion.setMetodo(this);
	}



	public void addValorEsperado(ValorEsperado aValue) {
		if (!valoresEsperados.contains(aValue)) {
			valoresEsperados.add(aValue);
			aValue.setMetodo(this);
		}
	}


	public List<ValorEsperado> getValoresEsperados() {
		return valoresEsperados;
	}

	public void setValoresEsperados(List<ValorEsperado> aValue) {
		this.valoresEsperados = aValue;
	}


	public boolean sinExpresion() {
		return getExpresion() == null || getExpresion().getExpresion().isEmpty();
	}

	
	


}
