package com.jkt.laboratorio.dominio;

import java.util.ArrayList;
import java.util.List;
import com.jkt.dominio.Descriptible;

/**
 * Representa una Determinación, o ensayo, que forma parte de un Análisis.
 * Se utiliza en la carga de los protocolos del Laboratorio.
 * Ejemplo: Contenido de Humedad (ppm).
 */
public class Determinacion extends Descriptible {


	private String metodo;
	private String tipoResultado;
	private Laboratorio laboratorio;

	/**
	 * Lista de valores válidos y de referencia de la determinación
	 */
	private List<ValoresValidosDeterminacion> listaValoresValidosDeterminacion = new ArrayList<ValoresValidosDeterminacion>();

	public void addValoresValidos(ValoresValidosDeterminacion valoresValidosDeterminacion) {
		if (!listaValoresValidosDeterminacion.contains(valoresValidosDeterminacion)) {
			listaValoresValidosDeterminacion.add(valoresValidosDeterminacion);
			valoresValidosDeterminacion.setDeterminacion(this);
		}
	}

	public void removeValoresValidos(ValoresValidosDeterminacion valoresValidosDeterminacion) {
		valoresValidosDeterminacion.setActivo(false);
		// listaValoresValidosDeterminacion.remove(valoresValidosDeterminacion);
	}

	/* -------------------------------------- Getters & Setters -------------------------------------- */
	

	public String getMetodo() {
		return metodo;
	}

	public void setMetodo(String metodo) {
		this.metodo = metodo;
	}

	public String getTipoResultado() {
		return tipoResultado;
	}

	public void setTipoResultado(String tipoResultado) {
		this.tipoResultado = tipoResultado;
	}
	
	public Laboratorio getLaboratorio() {
		return laboratorio;
	}

	public void setLaboratorio(Laboratorio aValue) {
		this.laboratorio = aValue;
	}

	public List<ValoresValidosDeterminacion> getListaValoresValidosDeterminacion() {
		return listaValoresValidosDeterminacion;
	}

	public void setListaValoresValidosDeterminacion(List<ValoresValidosDeterminacion> listaValoresValidosDeterminacion) {
		this.listaValoresValidosDeterminacion = listaValoresValidosDeterminacion;
	}

}
