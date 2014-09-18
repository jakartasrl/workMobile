package com.jkt.erp.articulos;

import com.jkt.dominio.PersistentEntity;

public class ArticuloStockDet extends PersistentEntity {

	private ArticuloStock articuloStock;
	private CaracteristicaProducto caracProducto;
	private ValoresTablas valorTabla;

	private String valorString;
	private int valorEntero;
	private double valorDoble;
	private boolean valorBoolean;

	/*
	 * Setters y getters
	 */
	public ArticuloStock getArticuloStock() {
		return articuloStock;
	}

	public void setArticuloStock(ArticuloStock articuloStock) {
		this.articuloStock = articuloStock;
	}

	public CaracteristicaProducto getCaracProducto() {
		return caracProducto;
	}

	public void setCaracProducto(CaracteristicaProducto caracProducto) {
		this.caracProducto = caracProducto;
	}

	public String getValorString() {
		return valorString;
	}

	public void setValorString(String valorString) {
		this.valorString = valorString;
	}

	public int getValorEntero() {
		return valorEntero;
	}

	public void setValorEntero(int valorEntero) {
		this.valorEntero = valorEntero;
	}

	public double getValorDoble() {
		return valorDoble;
	}

	public void setValorDoble(double valorDoble) {
		this.valorDoble = valorDoble;
	}

	public boolean isValorBoolean() {
		return valorBoolean;
	}

	public void setValorBoolean(boolean valorBoolean) {
		this.valorBoolean = valorBoolean;
	}

	public ValoresTablas getValorTabla() {
		return valorTabla;
	}

	public void setValorTabla(ValoresTablas valorTabla) {
		this.valorTabla = valorTabla;
	}

}
