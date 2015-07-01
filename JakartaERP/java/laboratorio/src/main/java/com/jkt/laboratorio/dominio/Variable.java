package com.jkt.laboratorio.dominio;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import com.jkt.dominio.Descriptible;

//@Data
public class Variable extends Descriptible {
	
//	private Determinacion determinacion;
	private boolean input;
//	private Expresion expresion;
	
	private boolean resultadoFinal;
	private double resultadoExpresion;
	
	//TRANSIENT FIELDS
	private String expresion;
	private List<Variable> variables=new ArrayList<Variable>();
	
	private long idTmp;
	
	private double valorInput;

	public long getIdTmp() {
		return idTmp;
	}

	public void setIdTmp(long idTmp) {
		this.idTmp = idTmp;
	}

	public boolean isInput() {
		return input;
	}

	public void setInput(boolean input) {
		this.input = input;
	}

	public boolean isResultadoFinal() {
		return resultadoFinal;
	}

	public void setResultadoFinal(boolean resultadoFinal) {
		this.resultadoFinal = resultadoFinal;
	}

	public double getResultadoExpresion() {
		return resultadoExpresion;
	}

	public void setResultadoExpresion(double resultadoExpresion) {
		this.resultadoExpresion = resultadoExpresion;
	}

	public String getExpresion() {
		return expresion;
	}

	public void setExpresion(String expresion) {
		this.expresion = expresion;
	}

	public List<Variable> getVariables() {
		return variables;
	}

	public void setVariables(List<Variable> variables) {
		this.variables = variables;
	}

	public double getValorInput() {
		return valorInput;
	}

	public void setValorInput(double valorInput) {
		this.valorInput = valorInput;
	}

	
}
