package com.jkt.varios.dominio;

import java.util.Date;

import com.jkt.dominio.PersistentEntity;

/**
 * Representa el tipo de cambio de una moneda con respecto a sus pares.(Euro a
 * Dolar, Peso a Real, Real a Dolar, etc...)
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TipoDeCambio extends PersistentEntity {

	/*
	 * TODO Ver como es el tipo de cambio por defecto. Seguramente va a estar parametrizado
	 */
	private Date fecha;
	private Moneda moneda;
	private double cotizacion;
	
	public TipoDeCambio() {
		fecha=new Date();
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public Moneda getMoneda() {
		return moneda;
	}

	public void setMoneda(Moneda moneda) {
		this.moneda = moneda;
	}

	public double getCotizacion() {
		return cotizacion;
	}

	public void setCotizacion(double cotizacion) {
		this.cotizacion = cotizacion;
	}

}
