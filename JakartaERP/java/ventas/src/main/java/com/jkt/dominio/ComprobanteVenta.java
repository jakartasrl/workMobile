package com.jkt.dominio;

import com.jkt.erp.varios.Representante;
import com.jkt.erp.varios.Vendedor;

public class ComprobanteVenta extends Comprobante {

	private Vendedor vendedor;
	private Representante representante;
	
//	private Cotizador cotizador;
//	private Pedido pedido;

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
