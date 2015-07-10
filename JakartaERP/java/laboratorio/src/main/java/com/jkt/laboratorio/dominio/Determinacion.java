package com.jkt.laboratorio.dominio;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import com.jkt.dominio.Descriptible;
import com.jkt.dominio.IDetalle;

/**
 * Representa una Determinación, o ensayo, que forma parte de un Análisis. Se
 * utiliza en la carga de los protocolos del Laboratorio. Ejemplo: Contenido de
 * Humedad (ppm).
 */
@Data
public class Determinacion extends Descriptible implements IDetalle {

	private Laboratorio laboratorio;
	private String tipoResultado;
	private String leyendaValorCero;
	private String formato;
	private boolean calculaResultado;
	private List<Metodo> metodos = new ArrayList<Metodo>();
	private List<Variable> variables = new ArrayList<Variable>();

	public void removeMetodo(Metodo aValue) {
		aValue.setActivo(false);
	}

	public void addMetodo(Metodo aValue) {
		if (!metodos.contains(aValue)) {
			metodos.add(aValue);
			aValue.setDeterminacion(this);
		}
	}

	public List<Metodo> getMetodos() {
		return metodos;
	}

	public void setMetodos(List<Metodo> aValue) {
		this.metodos = aValue;
	}

	public void addVariable(Variable aValue) {
		if (!variables.contains(aValue)) {
			variables.add(aValue);
//			aValue.setDeterminacion(this);
		}
	}

	public List<Variable> getVariables() {
		return variables;
	}

	public void setVariables(List<Variable> aValue) {
		this.variables = aValue;
	}

	public String getLeyendaValorCero() {
		return leyendaValorCero;
	}

	public void setLeyendaValorCero(String aValue) {
		this.leyendaValorCero = aValue;
	}

	public boolean isCalculaResultado() {
		return calculaResultado;
	}

	public void setCalculaResultado(boolean aValue) {
		this.calculaResultado = aValue;
	}

	public Laboratorio getLaboratorio() {
		return laboratorio;
	}

	public void setLaboratorio(Laboratorio aValue) {
		this.laboratorio = aValue;
	}

	public boolean sinMetodos() {
		return metodos.isEmpty();
	}

	public String getNombreDeMaestro() {
		return "laboratorio";
	}
	
	/*
	 * Campos trasientes.
	 */

	private double precio;
	private String codigoAnalisis;
	private String descripcionAnalisis;

	public String getCodigoAnalisis() {
		return codigoAnalisis;
	}

	public void setCodigoAnalisis(String codigoAnalisis) {
		this.codigoAnalisis = codigoAnalisis;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public String getDescripcionAnalisis() {
		return descripcionAnalisis;
	}

	public void setDescripcionAnalisis(String descripcionAnalisis) {
		this.descripcionAnalisis = descripcionAnalisis;
	}
	
}