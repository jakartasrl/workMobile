package com.jkt.arbol.clasificador;

import java.util.ArrayList;
import java.util.List;

import com.jkt.arbol.IArbol;
import com.jkt.arbol.INodo;

public class ComponenteNodo implements INodo {

	private List<INodo> hijos = new ArrayList<INodo>();
	private INodo padre;
	private int codigoInterno, codigoInternoPadre;
	private IArbol arbol;
	
	public List<INodo> getHijos() {
		return hijos;
	}

	public void setHijos(List<INodo> hijos) {
		this.hijos = hijos;
	}

	public INodo getPadre() {
		return padre;
	}

	public IArbol getArbol() {
		return arbol;
	}

	public void setCodigoInterno(int codigoInterno) {
		this.codigoInterno = codigoInterno;
	}

	public void setCodigoInternoPadre(int codigoInternoPadre) {
		this.codigoInternoPadre = codigoInternoPadre;
	}

	public int getCodigoInterno() {
		return codigoInterno;
	}

	public int getCodigoInternoPadre() {
		return codigoInternoPadre;
	}

	public void setArbol(IArbol arbol) {
		this.arbol=arbol;
	}

	public void setPadre(INodo padre) {
		this.padre=padre;
	}

	public void borrarHijos() {
		this.hijos.clear();
	}

	public void addHijo(INodo hijo) {
		this.hijos.add(hijo);
	}

}
