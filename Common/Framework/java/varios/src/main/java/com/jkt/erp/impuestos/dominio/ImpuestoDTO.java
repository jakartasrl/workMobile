package com.jkt.erp.impuestos.dominio;

import java.util.ArrayList;
import java.util.List;

import com.jkt.dominio.Descriptible;
import com.jkt.dominio.PersistentEntity;

public class ImpuestoDTO extends Descriptible {

	private List<CategoriaImpuesto> categorias = new ArrayList<CategoriaImpuesto>();
	private String comportamiento;// Es el DISCRIMINADOR

	public List<CategoriaImpuesto> getCategorias() {
		return categorias;
	}

	public void setCategorias(List<CategoriaImpuesto> categorias) {
		this.categorias = categorias;
	}

	public String getComportamiento() {
		return comportamiento;
	}

	public void setComportamiento(String comportamiento) {
		this.comportamiento = comportamiento;
	}

	public void agregarCategoria(CategoriaImpuesto categoria){
		categorias.add(categoria);
	}
}
