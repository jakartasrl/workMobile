package com.jkt.presupuesto.dominio;

/**
 * Clase de ayuda para mostrar un resumen de cada {@link PresupuestoDet} en el
 * reporte.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ItemResumen {
	
	private String numero;
	private String referencia;
	private String descripcion;
	private String precio;

	public ItemResumen(){}
	
	public ItemResumen(String numero, String referencia, String descripcion, String precio) {
		super();
		this.numero = numero;
		this.referencia = referencia;
		this.descripcion = descripcion;
		this.precio = precio;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getReferencia() {
		return referencia;
	}

	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getPrecio() {
		return precio;
	}

	public void setPrecio(String precio) {
		this.precio = precio;
	}

}
