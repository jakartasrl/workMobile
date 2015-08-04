package com.jkt.eventos;

import lombok.Data;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;

/**
 * Esta <strike>interface</strike> super clase reporta datos para la agenda.
 * <p>Cualquier entidad, objeto, tarea, o lo que sea que pueda ser representado en una agenda deber�
 * <strike>implementar esta interface</strike> extender de esta clase e implementar los metodos</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class Agendable extends PersistentEntity{

//	public abstract boolean sePuedeCompletar();
//	public abstract boolean sePuedeIniciar();
	
	public boolean sePuedeIniciar() throws JakartaException{
		throw new JakartaException("Debe implementar este metodo en alguna subclase");
	}

	public boolean sePuedeCompletar() throws JakartaException{
		throw new JakartaException("Debe implementar este metodo en alguna subclase");
	}
	
	/*
	 * Metadata para recuperar la tarea
	 */
	private long idTarea;
	private String claseTarea;
	
}
