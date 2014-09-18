package com.jkt.erp.articulos;

import java.util.ArrayList;
import java.util.List;

import com.jkt.dominio.Descriptible;

public class Producto extends Descriptible {

	private String descripcionAbrev;// descripcion abreviada
	private boolean comprable;
	private boolean vendible;
	private boolean stockeable;
	private boolean prodPropia;
	private boolean bien;

	private List<ProductoClasificador> clasificadores = new ArrayList<ProductoClasificador>();
	private TipoProducto tipoProducto;

	public List<ProductoClasificador> getClasificadores() {
		return clasificadores;
	}

	public void setClasificadores(List<ProductoClasificador> clasificadores) {
		this.clasificadores = clasificadores;
	}

	public String getDescripcionAbrev() {
		return descripcionAbrev;
	}

	public void setDescripcionAbrev(String descripcionAbrev) {
		this.descripcionAbrev = descripcionAbrev;
	}

	public boolean isComprable() {
		return comprable;
	}

	public void setComprable(boolean comprable) {
		this.comprable = comprable;
	}

	public boolean isVendible() {
		return vendible;
	}

	public void setVendible(boolean vendible) {
		this.vendible = vendible;
	}

	public boolean isStockeable() {
		return stockeable;
	}

	public void setStockeable(boolean stockeable) {
		this.stockeable = stockeable;
	}

	public boolean isProdPropia() {
		return prodPropia;
	}

	public void setProdPropia(boolean prodPropia) {
		this.prodPropia = prodPropia;
	}

	public boolean isBien() {
		return bien;
	}

	public void setBien(boolean bien) {
		this.bien = bien;
	}

	public TipoProducto getTipoProducto() {
		return tipoProducto;
	}

	public void setTipoProducto(TipoProducto tipoProducto) {
		this.tipoProducto = tipoProducto;
	}

}
