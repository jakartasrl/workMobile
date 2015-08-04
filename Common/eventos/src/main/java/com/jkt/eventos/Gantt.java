package com.jkt.eventos;

import org.joda.time.LocalDateTime;
import org.joda.time.Period;

import com.jkt.grafo.DatoNodo;
import com.jkt.grafo.NodoGenerico;

/**
 * El gantt sera un grafo que contendra datos tales como fecha de inicio en formato 
 * de {@link LocalDateTime} y una duracion representada con {@link Period}
 *
 * Leonel Suarez - Jakarta SRL
 */
abstract public class Gantt<T extends DatoNodo> extends NodoGenerico<T> {

	private LocalDateTime fechaInicio;
	private Period duracion;

	public LocalDateTime getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(LocalDateTime fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public Period getDuracion() {
		return duracion;
	}

	public void setDuracion(Period duracion) {
		this.duracion = duracion;
	}

	/**
	 * Procesa utilizando los campos fechaInicio y duracion, cual sera la fecha de finalizacion
	 * 
	 * @return {@link LocalDateTime}
	 */
	abstract public LocalDateTime getFechaDeFinalizacion();
	
}
