package com.jkt.erp.articulos;

import javax.validation.constraints.NotNull;

import com.jkt.dominio.PersistentEntity;
import com.jkt.varios.dominio.UnidadMedida;

public class ArticuloStock extends PersistentEntity {

	@NotNull(message="El Articulo debe tener relacionado un producto.")
	private Producto producto;
	
	@NotNull(message="Es necesario que el articulo tenga una unidad de medida principal.")
	private UnidadMedida uniMedPrin;
	
	private UnidadMedida uniMedSec;
	private UnidadMedida uniMedTerc;

	/*
	 * Setters y getters
	 */
	public Producto getProducto() {
		return producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}

	public UnidadMedida getUniMedPrin() {
		return uniMedPrin;
	}

	public void setUniMedPrin(UnidadMedida uniMedPrin) {
		this.uniMedPrin = uniMedPrin;
	}

	public UnidadMedida getUniMedSec() {
		return uniMedSec;
	}

	public void setUniMedSec(UnidadMedida uniMedSec) {
		this.uniMedSec = uniMedSec;
	}

	public UnidadMedida getUniMedTerc() {
		return uniMedTerc;
	}

	public void setUniMedTerc(UnidadMedida uniMedTerc) {
		this.uniMedTerc = uniMedTerc;
	}

}
