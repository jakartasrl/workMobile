package com.jkt.erp.impuestos.dominio;

import java.util.ArrayList;
import java.util.List;

import com.jkt.dominio.Descriptible;
import com.jkt.dominio.IDescriptible;

/**
 * Representa todos los tipos de impuestos que se asociaran a los clientes y
 * proveedores
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Impuesto extends Descriptible implements IDescriptible{

	private List<CategoriaImpuesto> categorias = new ArrayList<CategoriaImpuesto>();

	private String comportamiento;
	
	public String getComportamiento() {
		return comportamiento;
	}

	public void setComportamiento(String comportamiento) {
		this.comportamiento = comportamiento;
	}

	public List<CategoriaImpuesto> getCategorias() {
		return categorias;
	}

	public void setCategorias(List<CategoriaImpuesto> categorias) {
		this.categorias = categorias;
	}

	public void agregarCategoria(CategoriaImpuesto categoria) {
		if (!categorias.contains(categoria)) {
			categoria.setImpuesto(this);
			getCategorias().add(categoria);
		}
	}

	public String getCadena() {
		// TODO Auto-generated method stub
		return getDescripcion();
	}

	// abstract List getCategorias();

}
