package com.jkt.agenda;

import org.joda.time.LocalDate;

import com.jkt.grafo.NodoGenerico;

/**
 * Es la entidad persistente.
 * <p>No contiene mucha mas logica que la del NodoGenerico, sino que:</p>
 * <p>Le declara el dato T generic.</p>
 * <p>Mapea los atributos contra la base.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class EventoAgenda extends NodoGenerico<Evento> {

	
	/*
	 * Variables de instancia
	 */
	private LocalDate fechaInicio=LocalDate.now();
	private int diasDuracion=1;
	private String sector; //Puede ser laboratorio quimico, laboratorio electrico, taller, service.
	
	/*
	 * Audit for to know who was the user that finish it (a task)
	 */
	private String usuario;
	private LocalDate fechaFin;
	private int diasAtrasados=0;
	
	/*
	 * setters y getters
	 */
	
	public LocalDate getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(LocalDate fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	public int getDiasDuracion() {
		return diasDuracion;
	}
	public void setDiasDuracion(int diasDuracion) {
		this.diasDuracion = diasDuracion;
	}
	public String getSector() {
		return sector;
	}
	public void setSector(String sector) {
		this.sector = sector;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public LocalDate getFechaFin() {
		return fechaFin;
	}
	public void setFechaFin(LocalDate fechaFin) {
		this.fechaFin = fechaFin;
	}
	public int getDiasAtrasados() {
		return diasAtrasados;
	}
	public void setDiasAtrasados(int diasAtrasados) {
		this.diasAtrasados = diasAtrasados;
	}

}
