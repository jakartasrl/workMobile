package com.jkt.laboratorio.dominio;

import java.util.ArrayList;
import java.util.List;

import com.jkt.dominio.PersistentEntity;

public class Metodo extends PersistentEntity {
	private Determinacion 		determinacion;
	private String        		metodo;
	private String        		expresionResultado;
	private List<ValorEsperado> valoresEsperados = new ArrayList<ValorEsperado>();
	private List<Variable>      variables = new ArrayList<Variable>();


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
		return expresionResultado;
	}


	public void setExpresionResultado(String expresionResultado) {
		this.expresionResultado = expresionResultado;
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

	
	

	public void addVariable(Variable aValue) {
		if (!variables.contains(aValue)) {
			variables.add(aValue);
			aValue.setMetodo(this);
		}
	}


	public List<Variable> getVariables() {
		return variables;
	}

	public void setVariables(List<Variable> aValue) {
		this.variables = aValue;
	}

}
