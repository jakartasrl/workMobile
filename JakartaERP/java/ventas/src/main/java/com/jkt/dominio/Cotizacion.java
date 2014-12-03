package com.jkt.dominio;

import java.util.Date;

public class Cotizacion extends ComprobanteVenta {

	public enum Estado { PENDIENTE, INICIADA};
	
	private String estado;
	private Date fechaVencimiento;
	private String referencia;
	
	/*
	 * Setters y getters
	 */
	public Date getFechaVencimiento() {
		return fechaVencimiento;
	}

	public String getReferencia() {
		return referencia;
	}

	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}

	public void setFechaVencimiento(Date fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getDescripcion(){
		return String.format("%s/%s",this.getFecha().toString(), this.getClienteSucursal().getDescripcion());
//		return String.format("Cotizacion numero %d para cliente %s, fecha de creacion %s.",this.getNro(),this.getClienteSucursal().getCliente().getDescripcion(),this.getFecha().toString());
	}
	
	public String getCodigo(){
		return String.valueOf(this.getNro());
	}
	
}
