package com.jkt.dominio;

import java.util.ArrayList;
import java.util.List;

public class ContenedorFiltros extends PersistentEntity{

	private String clase;
	private List<Filtro> filtros = new ArrayList<Filtro>();

	public String getClase() {
		return clase;
	}

	public void setClase(String clase) {
		this.clase = clase;
	}

	public List<Filtro> getFiltros() {
		return filtros;
	}

	public void setFiltros(List<Filtro> filtros) {
		this.filtros = filtros;
	}

}
