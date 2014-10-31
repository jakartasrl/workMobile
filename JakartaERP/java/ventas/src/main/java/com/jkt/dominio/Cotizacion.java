package com.jkt.dominio;

public class Cotizacion extends ComprobanteVenta {

	public enum Estado { PENDIENTE, INICIADA};
	
	private Estado estado;

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}

}
