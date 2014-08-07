package com.jkt.dominio;

import java.util.ArrayList;
import java.util.List;

public class Filtros extends PersistentEntity {

	private List<Filtro> valores=new ArrayList<Filtro>();

	public void agregarFiltro(Filtro filtro){
		valores.add(filtro);
	}
	
	public List<Filtro> getValores() {
		return valores;
	}

	public void setValores(List<Filtro> valores) {
		this.valores = valores;
	}
	
	
	
}
