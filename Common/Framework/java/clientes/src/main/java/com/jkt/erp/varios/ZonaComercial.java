package com.jkt.erp.varios;

import com.jkt.dominio.Descriptible;

/**
 * Entidad que representa a una zona comercial
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ZonaComercial extends Descriptible {

	private static final long serialVersionUID = 7824980980237749953L;
	private Vendedor vendedor;

	public Vendedor getVendedor() {
		return vendedor;
	}

	public void setVendedor(Vendedor vendedor) {
		this.vendedor = vendedor;
	}

}
