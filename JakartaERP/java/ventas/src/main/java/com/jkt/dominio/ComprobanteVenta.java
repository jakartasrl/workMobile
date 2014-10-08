package com.jkt.dominio;

import java.util.ArrayList;
import java.util.List;

import com.jkt.erp.varios.Representante;
import com.jkt.erp.varios.Vendedor;

public class ComprobanteVenta extends ComprobanteCliente {

	private Vendedor vendedor;
	private Representante representante;
	private List<ComprobanteVentaDet> detalles = new ArrayList<ComprobanteVentaDet>();

	public List<ComprobanteVentaDet> getDetalles() {
		return detalles;
	}

	public void setDetalles(List<ComprobanteVentaDet> detalles) {
		this.detalles = detalles;
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
