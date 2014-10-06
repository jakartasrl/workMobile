package com.jkt.laboratorio.dominio;

import java.util.ArrayList;
import java.util.List;
import com.jkt.dominio.Descriptible;

/**
 * Representa un Análisis que se puede hacer en un Laboratorio.
 * Se utiliza en los pedidos de Laboratorio y en los protocolos.
 * Ejemplo: Análisis físico-químico de un transformador.
 */
public class Analisis extends Descriptible {

	private static final long serialVersionUID = 1L;

	/**
	 * Tipo de Laboratorio al que pertenece
	 */
	private Laboratorio laboratorio;

	/**
	 * Lista de Ensayos o Determinaciones que incluye el Análisis.
	 */
	private List<Determinacion> listaDeterminaciones = new ArrayList<Determinacion>();

	public void addDeterminacion(Determinacion determinacion) {
		if (!this.listaDeterminaciones.contains(determinacion)) {
			listaDeterminaciones.add(determinacion);
			determinacion.setAnalisis(this);
		}
	}

	public void deleteDeterminacion(Determinacion determinacion) {
		determinacion.setActivo(false);
		// listaDeterminaciones.remove(determinacion);
		// determinacion.setAnalisis(null);
	}

	/* -------------------------------------- Getters & Setters -------------------------------------- */
	public Laboratorio getLaboratorio() {
		return laboratorio;
	}

	public void setLaboratorio(Laboratorio laboratorio) {
		this.laboratorio = laboratorio;
	}

	public List<Determinacion> getListaDeterminaciones() {
		return listaDeterminaciones;
	}

	public void setListaDeterminaciones(List<Determinacion> listaDeterminaciones) {
		this.listaDeterminaciones = listaDeterminaciones;
	}
}
