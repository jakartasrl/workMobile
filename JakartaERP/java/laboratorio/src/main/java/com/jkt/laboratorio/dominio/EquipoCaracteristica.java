package com.jkt.laboratorio.dominio;

import javax.validation.constraints.NotNull;

import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.articulos.CaracteristicaProducto;
import com.jkt.erp.articulos.ValoresTablas;

/**
 * <p>Representa a una caracteristica que puede tener el equipo.</p>
 * <p>Esta caracteristica puede tener valores simples como cadenas, numeros o precios, pero ademas puede tener referencia
 * a un valor {@link ValoresTablas} de una tabla en la base de datos, es decir, una referencia a por ejemplo,
 * un color <b>rojo</b>, que es el valor, de la tabla <b>colores</b>.</p>
 */
public class EquipoCaracteristica extends PersistentEntity {

	@NotNull
	private Equipo equipo;
	
	private CaracteristicaProducto caracProducto;

	private ValoresTablas valorTabla;
	
	private String valorString;
	private int valorEntero;
	private double valorDoble;
	private boolean valorBoolean;

	public Equipo getEquipo() {
		return equipo;
	}

	public void setEquipo(Equipo equipo) {
		this.equipo = equipo;
	}

	public CaracteristicaProducto getCaracProducto() {
		return caracProducto;
	}

	public void setCaracProducto(CaracteristicaProducto caracProducto) {
		this.caracProducto = caracProducto;
	}

	public ValoresTablas getValorTabla() {
		return valorTabla;
	}

	public void setValorTabla(ValoresTablas valorTabla) {
		this.valorTabla = valorTabla;
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

}
