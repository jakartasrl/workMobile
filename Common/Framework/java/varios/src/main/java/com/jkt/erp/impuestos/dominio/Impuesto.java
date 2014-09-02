package com.jkt.erp.impuestos.dominio;

import java.util.ArrayList;
import java.util.List;

import com.jkt.dominio.Descriptible;

/**
 * Representa todos los tipos de impuestos que se asociaran a los clientes y
 * proveedores
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
abstract public class Impuesto extends Descriptible {

	private static final long serialVersionUID = -7825370624771296086L;

	private List<CategoriaImpuesto> categorias = new ArrayList<CategoriaImpuesto>();

	public List<CategoriaImpuesto> getCategorias() {
		return categorias;
	}

	public void setCategorias(List<CategoriaImpuesto> categorias) {
		this.categorias = categorias;
	}
	
	public void agregarCategoria(CategoriaImpuesto categoria){
		getCategorias().add(categoria);
	}
	
	// abstract List getCategorias();

}
