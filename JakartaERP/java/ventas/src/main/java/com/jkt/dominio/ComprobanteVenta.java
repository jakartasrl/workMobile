package com.jkt.dominio;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import com.jkt.erp.varios.Representante;
import com.jkt.erp.varios.Vendedor;

/**
 * Comprobante que representa un evento de cotizacion/pedido
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public abstract class ComprobanteVenta extends ComprobanteCliente {

	@NotNull(message="Debe ingresar obligatoriamente un vendedor.")
	private Vendedor vendedor;
	
	private Representante representante;

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
