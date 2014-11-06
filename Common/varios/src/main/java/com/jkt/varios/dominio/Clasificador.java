package com.jkt.varios.dominio;

import java.util.ArrayList;
import java.util.List;

import com.jkt.dominio.Descriptible;

/**
 * <p> Representa una clasificacion de cualquier entidad "Clasificable" </p>
 * 
 * <p> Trabaja como una metaclase que define a los clasificadores de una entidad </p>
 * 
 * <p> Se utilizará para poder clasificar de distintas maneras a los objetos de las entidades clasificables </p>
 * 
 * @see Componente
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Clasificador extends Descriptible {

	private String entidad;
	private boolean obligatorio;
	
	public boolean isObligatorio() {
		return obligatorio;
	}

	public void setObligatorio(boolean obligatorio) {
		this.obligatorio = obligatorio;
	}

	/*
	 * Es el componente de level cero?
	 */
	private Componente componentePadre;

	public String getEntidad() {
		return entidad;
	}

	public void setEntidad(String entidad) {
		this.entidad = entidad;
	}

	public Componente getComponentePadre() {
		return componentePadre;
	}

	public void setComponentePadre(Componente componentePadre) {
		this.componentePadre = componentePadre;
	}

	/*
	 * Para el manejo de componentes.
	 * Yo no se cual es el ultimo elemento, con lo cual debo guardar todo desordenado, y posteriormente ordenar los componentes por nivel.
	 */

	private List<Componente> componentes=new ArrayList<Componente>();
	public void agregarComponente(Componente componente){
		componentes.add(componente);
	}

	public List<Componente> getComponentes() {
		return componentes;
	}

	public void setComponentes(List<Componente> componentes) {
		this.componentes = componentes;
	}
	
	
}
