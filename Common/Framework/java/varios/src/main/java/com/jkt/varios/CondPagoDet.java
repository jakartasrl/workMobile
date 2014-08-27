package com.jkt.varios;

import com.jkt.dominio.PersistentEntity;

/**
 * Indica a cuantos dias sera el pago y el porcentaje del total que representa.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class CondPagoDet extends PersistentEntity {

	private static final long serialVersionUID = 3815149294480787624L;

	private int dias;
	private double porcentaje;
	private CondPago condicionDePago;

	public CondPago getCondicionDePago() {
		return condicionDePago;
	}

	public void setCondicionDePago(CondPago condicionDePago) {
		this.condicionDePago = condicionDePago;
	}

	public int getDias() {
		return dias;
	}

	public void setDias(int dias) {
		this.dias = dias;
	}

	public double getPorcentaje() {
		return porcentaje;
	}

	public void setPorcentaje(double porcentaje) {
		this.porcentaje = porcentaje;
	}

}
