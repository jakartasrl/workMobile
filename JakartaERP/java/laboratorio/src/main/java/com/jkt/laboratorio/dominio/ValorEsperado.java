package com.jkt.laboratorio.dominio;

import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.articulos.CaracteristicaProducto;

/**
 * Representa los valores que pueden asumir los resultados de una Determinación.<br>
 * Se utiliza para validar el valor ingresado en la carga de los protocolos del Laboratorio.<br>
 * Ejemplo: Para transformadores de mas de 60kv:<br>
 * Para la Determinación CONTENIDO DE INHIBIDOR(%) : El valor válido está en un rango de 1 a 6.
 */
public class ValorEsperado extends PersistentEntity {

	private Metodo metodo;
	private CaracteristicaProducto caracteristica;
	private double valorDesde;
	private double valorHasta;
	private String limite;
	/* -------------------------------------- Getters & Setters -------------------------------------- */	
	public Metodo getMetodo() {
		return metodo;
	}

	
	public void setMetodo(Metodo aValue) {
		this.metodo = aValue;
	}

	
	public CaracteristicaProducto getCaracteristica() {
		return caracteristica;
	}

	
	public void setCaracteristica(CaracteristicaProducto caracteristica) {
		this.caracteristica = caracteristica;
	}

	
	public double getValorDesde() {
		return valorDesde;
	}

	
	public void setValorDesde(double valorDesde) {
		this.valorDesde = valorDesde;
	}

	
	public double getValorHasta() {
		return valorHasta;
	}

	
	public void setValorHasta(double valorHasta) {
		this.valorHasta = valorHasta;
	}

	
	public String getLimite() {
		return limite;
	}

	
	public void setLimite(String aValue) {
		this.limite = aValue;
	}

	
}
