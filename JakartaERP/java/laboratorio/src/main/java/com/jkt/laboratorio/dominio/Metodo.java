package com.jkt.laboratorio.dominio;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import com.jkt.dominio.PersistentEntity;

@Data
public class Metodo extends PersistentEntity {

	private Determinacion determinacion;
	private String metodo;
	private Expresion expresion;

	private List<ValorEsperado> valoresEsperados = new ArrayList<ValorEsperado>();
	private List<Variable> variables = new ArrayList<Variable>();
	private List<Variable> variablesT = new ArrayList<Variable>();

	public void addValorEsperado(ValorEsperado aValue) {
		if (!valoresEsperados.contains(aValue)) {
			valoresEsperados.add(aValue);
			aValue.setMetodo(this);
		}
	}

}
