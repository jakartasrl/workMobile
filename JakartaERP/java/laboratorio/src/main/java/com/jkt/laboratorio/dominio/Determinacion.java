package com.jkt.laboratorio.dominio;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.dominio.Descriptible;
import com.jkt.dominio.IDetalle;
import com.jkt.erp.articulos.Producto;

/**
 * Representa una Determinación, o ensayo, que forma parte de un Análisis. Se
 * utiliza en la carga de los protocolos del Laboratorio. Ejemplo: Contenido de
 * Humedad (ppm).
 */
@Data
@EqualsAndHashCode(callSuper=true, of={})
public class Determinacion extends Descriptible implements IDetalle {

	private Laboratorio laboratorio;
	private String tipoResultado;
	private String leyendaValorCero;
	private String formato;
	private boolean calculaResultado;
	private List<Metodo> metodos = new ArrayList<Metodo>();
	private List<Variable> variables = new ArrayList<Variable>();

	private Producto articuloRelacionado;
	
	public void removeMetodo(Metodo aValue) {
		aValue.setActivo(false);
	}

	public void addMetodo(Metodo aValue) {
		if (!metodos.contains(aValue)) {
			metodos.add(aValue);
//			aValue.setDeterminacion(this);
		}
	}

	public void addVariable(Variable aValue) {
		if (!variables.contains(aValue)) {
			variables.add(aValue);
		}
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
	
}