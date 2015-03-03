package com.jkt.agenda;

import com.jkt.excepcion.JakartaException;
import com.jkt.grafo.DatoNodo;
import com.jkt.grafo.Agendable;

/**
 * Un evento, ademas de tener los atributos de {@link DatoNodo} contiene un objetivo que es quien realmente le da el estado.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Evento extends DatoNodo {

	/*
	 * El atributo objetivo representa a una tarea, un pedido, un ensayo de laboratorio, cualquier elemento que pueda ser representado como tarea dentro de una agenda
	 */
	private Agendable objetivo;

	public Agendable getObjetivo() {
		return objetivo;
	}

	public void setObjetivo(Agendable objetivo) {
		this.objetivo = objetivo;
	}

	@Override
	protected boolean sePuedeFinalizar() throws JakartaException {
		return objetivo.sePuedeCompletar();
	}

	@Override
	protected boolean sePuedeIniciar() throws JakartaException {
		return objetivo.sePuedeIniciar();
	}

}

