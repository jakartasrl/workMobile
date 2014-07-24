package com.jkt.eventos;

/**
 * Evento que notifica a observadores.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public abstract class Evento {
	private Class clazz;
	private Object parametro;

	public Evento(Class clazz, Object parametro){
		this.clazz=clazz;
		this.parametro=parametro;
	}

	public Class getClazz() {
		return clazz;
	}

	public Object getParametro() {
		return parametro;
	}

}
