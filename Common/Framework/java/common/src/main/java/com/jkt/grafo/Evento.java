package com.jkt.grafo;

/**
 * Un evento, ademas de tener los atributos de {@link DatoNodo} contiene un objetivo que es quien realmente le da el estado.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Evento extends DatoNodo {

	/*
	 * El atributo objetivo representa a una tarea, un pedido, un ensayo de alboratorio, cualquier elemento que pueda ser representado como tarea dentro de una agenda
	 */
	private IAgendable objetivo;

	public IAgendable getObjetivo() {
		return objetivo;
	}

	public void setObjetivo(IAgendable objetivo) {
		this.objetivo = objetivo;
	}

	@Override
	protected boolean sePuedeFinalizar() {
		return objetivo.sePuedeCompletar();
	}

	@Override
	protected boolean sePuedeIniciar() {
		return objetivo.sePuedeIniciar();
	}

}

