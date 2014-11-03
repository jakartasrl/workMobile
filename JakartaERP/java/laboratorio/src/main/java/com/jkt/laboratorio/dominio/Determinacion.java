package com.jkt.laboratorio.dominio;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.validator.constraints.NotBlank;

import com.jkt.dominio.Descriptible;
import com.jkt.dominio.IDetalle;

/**
 * Representa una Determinación, o ensayo, que forma parte de un Análisis.
 * Se utiliza en la carga de los protocolos del Laboratorio.
 * Ejemplo: Contenido de Humedad (ppm).
 */
public class Determinacion extends Descriptible implements IDetalle{


	private Laboratorio laboratorio;
	private String tipoResultado;
	private String leyendaValorCero;
	private String formato;
	private boolean calculaResultado;
	private List<Metodo> metodos = new ArrayList<Metodo>();
	private List<Variable>      variables = new ArrayList<Variable>();

	
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
			aValue.setDeterminacion(this);
		}
	}


	public List<Variable> getVariables() {
		return variables;
	}

	public void setVariables(List<Variable> aValue) {
		this.variables = aValue;
	}



	/* -------------------------------------- Getters & Setters -------------------------------------- */
	

	public String getLeyendaValorCero() {
		return leyendaValorCero;
	}

	public void setLeyendaValorCero(String aValue) {
		this.leyendaValorCero = aValue;
	}

	
	public String getTipoResultado() {
		return tipoResultado;
	}

	@NotBlank(message="El tipo de resultado no debe estar vacio.")
	public void setTipoResultado(String tipoResultado) {
		this.tipoResultado = tipoResultado;
	}

	public String getFormato() {
		return formato;
	}

	public void setFormato(String aValue) {
		this.formato = aValue;
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

}
