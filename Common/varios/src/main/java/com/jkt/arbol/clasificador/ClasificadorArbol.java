package com.jkt.arbol.clasificador;

import java.util.ArrayList;
import java.util.List;

import com.jkt.arbol.IArbol;
import com.jkt.arbol.INodo;

public class ClasificadorArbol implements IArbol {

	private List<INodo> hijos = new ArrayList<INodo>();
	private List<INodo> hijosTransientes = new ArrayList<INodo>();

	
	public List<INodo> getHijosTransientes() {
		return hijosTransientes;
	}

	public void setHijosTransientes(List<INodo> hijosTransientes) {
		this.hijosTransientes = hijosTransientes;
	}

	public List<INodo> getHijos() {
		return hijos;
	}

	public void agregarHijo(INodo hijoDePrimerNivel) {
		hijos.add(hijoDePrimerNivel);
	}

	public void setHijos(List<INodo> hijos) {
		this.hijos = hijos;
	}

}
