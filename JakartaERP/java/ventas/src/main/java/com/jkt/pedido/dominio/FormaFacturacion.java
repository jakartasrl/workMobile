package com.jkt.pedido.dominio;

import com.jkt.dominio.PersistentEntity;

/**
 * Representa a las formas de facturar un item de pedido.
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class FormaFacturacion extends PersistentEntity {

	private String nombre;
	private int porcentaje;
	private double costo;

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getPorcentaje() {
		return porcentaje;
	}

	public void setPorcentaje(int porcentaje) {
		this.porcentaje = porcentaje;
	}

	public double getCosto() {
		return costo;
	}

	public void setCosto(double costo) {
		this.costo = costo;
	}

}
