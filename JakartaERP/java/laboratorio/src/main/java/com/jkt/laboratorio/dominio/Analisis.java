package com.jkt.laboratorio.dominio;

import java.util.ArrayList;
import java.util.List;

import com.jkt.dominio.Descriptible;
import com.jkt.dominio.IDetalle;

/**
 * Representa un Análisis que se puede hacer en un Laboratorio.
 * Se utiliza en los pedidos de Laboratorio y en los protocolos.
 * Ejemplo: Análisis físico-químico de un transformador.
 */
public class Analisis extends Descriptible  implements IDetalle{

	/**
	 * Tipo de Laboratorio al que pertenece
	 */
	private Laboratorio laboratorio;

	/**
	 * Lista de Ensayos o Determinaciones que incluye el Análisis.
	 */
	private List<AnalisisDet> listaDeterminaciones = new ArrayList<AnalisisDet>();

	public void addDeterminacion(AnalisisDet detalle) {
		if (!this.listaDeterminaciones.contains(detalle)) {
			listaDeterminaciones.add(detalle);
			detalle.setAnalisis(this);
		}
	}

	public void deleteDeterminacion(AnalisisDet detalle) {
		detalle.setActivo(false);
	}

	/* -------------------------------------- Getters & Setters -------------------------------------- */
	public Laboratorio getLaboratorio() {
		return laboratorio;
	}

	public void setLaboratorio(Laboratorio laboratorio) {
		this.laboratorio = laboratorio;
	}

	public List<AnalisisDet> getListaDeterminaciones() {
		return listaDeterminaciones;
	}

	public void setListaDeterminaciones(List<AnalisisDet> listaDeterminaciones) {
		this.listaDeterminaciones = listaDeterminaciones;
	}

	public String getNombreDeMaestro() {
		return "laboratorio";
	}
}
