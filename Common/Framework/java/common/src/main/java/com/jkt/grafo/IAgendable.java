package com.jkt.grafo;

/**
 * Esta interface reporta datos para la agenda.
 * <p>Cualquier entidad, objeto, tarea, o lo que sea que pueda ser representado en una agenda deberá
 * implementar esta interface</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public interface IAgendable {

	boolean sePuedeCompletar();
	boolean sePuedeIniciar();
	long getId();
	
}
