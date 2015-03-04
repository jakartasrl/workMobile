package com.jkt.dominio;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

import com.jkt.erp.varios.Representante;
import com.jkt.erp.varios.Vendedor;
import com.jkt.varios.dominio.Contacto;

/**
 * Comprobante que representa un evento de cotizacion/pedido
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public abstract class ComprobanteVenta extends ComprobanteCliente {

	@NotNull(message="Debe ingresar obligatoriamente un vendedor.")
	private Vendedor vendedor;
	
	private Representante representante;
	
	private Date fechaVencimiento;
	private String referencia;
	
	@NotNull(message="El comprobante debe tener obligatoriamente un contacto de referencia.")
	private Contacto contactoReferencia;

	public Date getFechaVencimiento() {
		return fechaVencimiento;
	}

	public void setFechaVencimiento(Date fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}

	public String getReferencia() {
		return referencia;
	}

	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}

	public Contacto getContactoReferencia() {
		return contactoReferencia;
	}

	public void setContactoReferencia(Contacto contactoReferencia) {
		this.contactoReferencia = contactoReferencia;
	}

	public Vendedor getVendedor() {
		return vendedor;
	}

	public void setVendedor(Vendedor vendedor) {
		this.vendedor = vendedor;
	}

	public Representante getRepresentante() {
		return representante;
	}

	public void setRepresentante(Representante representante) {
		this.representante = representante;
	}

}
