package com.jkt.erp.articulos;

import javax.validation.constraints.NotNull;

import com.jkt.dominio.PersistentEntity;

public class ProductoDet extends PersistentEntity {

	/*
	 * Campo casi principal de la clase.
	 * La caracteristica define el tipo, que son los 5 o 6 atributos restantes.
	 */
	@NotNull(message="El detalle del producto debe tener asociada una caracteristica.")
	private CaracteristicaProducto caracProducto;
	
	private ValoresTablas valorTabla;
	private String valorString;
	private int valorEntero;
	private double valorDoble;
	private boolean valorBoolean;
	
	@NotNull
	private Producto producto;
	
	/*
	 * Setters y getters
	 */

	public CaracteristicaProducto getCaracProducto() {
		return caracProducto;
	}

	public Producto getProducto() {
		return producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
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
