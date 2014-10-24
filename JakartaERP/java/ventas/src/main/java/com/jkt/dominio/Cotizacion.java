package com.jkt.dominio;

public class Cotizacion extends ComprobanteVenta {

	public static final String PENDIENTE = "PENDIENTE";
	public static final String INICIADA = "INICIADA";

	private String estado;

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

}
