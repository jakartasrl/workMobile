package com.jkt.pedido.dominio;

import com.jkt.dominio.ComprobanteVenta;

/**
 * <p>Un pedido genera un comprobante.</p>
 * <p>Este pedido tendra detalles relacionados.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Pedido extends ComprobanteVenta {

	private String campo;

	public String getCampo() {
		return campo;
	}

	public void setCampo(String campo) {
		this.campo = campo;
	}
	
	
}
