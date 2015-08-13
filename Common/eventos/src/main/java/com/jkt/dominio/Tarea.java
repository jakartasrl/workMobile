package com.jkt.dominio;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import com.jkt.excepcion.JakartaException;

/**
 * clase abstracta para brindar atributos de estados y maquinas.
 * Si se hace una interface, cada una de las tareas q implementen esto tendrian que declarar las variables, tener la logica de avanzar estados, de retroceder y demas.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public abstract class Tarea extends PersistentEntity {
	
	private String nombre;
	private Estado estadoActual;
	private MaquinaEstado maquinaEstado;
	
	private List<Tarea> posteriores = new ArrayList<Tarea>();
	private List<Tarea> precedentes = new ArrayList<Tarea>();
	
	public void avanzarEstado() throws JakartaException{
		this.estadoActual = this.maquinaEstado.siguiente(this.estadoActual);
	}

	public void retrocederEstado() throws JakartaException{
		this.estadoActual = this.maquinaEstado.anterior(this.estadoActual);
	}
	
	public void agregarPosterior(Tarea t){
		this.posteriores.add(t);
	}

	public void agregarPrecedente(Tarea t){
		this.precedentes.add(t);
	}
	
	public boolean estadoFinal() throws JakartaException{
		return this.maquinaEstado.estaEnElFinal(this.estadoActual);
	}
	
}
