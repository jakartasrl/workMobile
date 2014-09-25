package com.jkt.erp.articulos;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import com.jkt.dominio.PersistentEntity;
import com.jkt.varios.dominio.UnidadMedida;

public class ArticuloStock extends PersistentEntity {

	@NotNull(message="El Articulo debe tener relacionado un producto.")
	private Producto producto;
	
	private List<ArticuloStockDet> detalles= new ArrayList<ArticuloStockDet>();
	
	/*
	 * Setters y getters
	 */
	
	public Producto getProducto() {
		return producto;
	}

	public List<ArticuloStockDet> getDetalles() {
		return detalles;
	}

	public void setDetalles(List<ArticuloStockDet> detalles) {
		this.detalles = detalles;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}

	public void agregarDetalle(ArticuloStockDet detalle){
		if (!detalles.contains(detalle)) {
			detalles.add(detalle);
			detalle.setArticuloStock(this);
		}
	}

}
