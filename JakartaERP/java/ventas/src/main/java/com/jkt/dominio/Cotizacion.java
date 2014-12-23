package com.jkt.dominio;

import java.util.Date;

import com.jkt.varios.dominio.Contacto;

/**
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Cotizacion extends ComprobanteVenta {

	public enum Estado { PENDIENTE, INICIADA};
	
	private String estado;
	private Date fechaVencimiento;
	private String referencia;
	private Contacto contactoReferencia;
	
	/*
	 * Setters y getters
	 */
	public Date getFechaVencimiento() {
		return fechaVencimiento;
	}

	public Contacto getContactoReferencia() {
		return contactoReferencia;
	}

	public void setContactoReferencia(Contacto contactoReferencia) {
		this.contactoReferencia = contactoReferencia;
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
	}
	
	public String getCodigo(){
		return String.valueOf(this.getNro());
	}
	
}
