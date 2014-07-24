package com.jkt.dominio;

import org.joda.time.LocalDate;

import com.jkt.grafo.DatoNodo;

public class Tarea extends DatoNodo {

	private LocalDate fechaInicio;
	private LocalDate fechaFin;

	public LocalDate getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(LocalDate fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public LocalDate getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(LocalDate fechaFin) {
		this.fechaFin = fechaFin;
	}

	@Override
	protected boolean sePuedeCompletar() {
		return true;
	}

}
