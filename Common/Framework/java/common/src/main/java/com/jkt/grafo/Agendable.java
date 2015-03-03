package com.jkt.grafo;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;

/**
 * Esta <strike>interface</strike> super clase reporta datos para la agenda.
 * <p>Cualquier entidad, objeto, tarea, o lo que sea que pueda ser representado en una agenda deberá
 * <strike>implementar esta interface</strike> extender de esta clase e implementar los metodos</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
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
	
	/*
	 * Getters & setters
	 */
	public long getIdTarea() {
		return idTarea;
	}
	public void setIdTarea(long idTarea) {
		this.idTarea = idTarea;
	}
	public String getClaseTarea() {
		return claseTarea;
	}
	public void setClaseTarea(String claseTarea) {
		this.claseTarea = claseTarea;
	}
	
	
}
