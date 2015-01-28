package com.jkt.dominio;

/**
 * <p>Un pedido genera un comprobante.</p>
 * <p>Este pedido tendra detalles relacionados.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Pedido extends ComprobanteVenta {

	private String numeroPedido;

	public String getNumeroPedido() {
		return numeroPedido;
	}

	public void setNumeroPedido(String numeroPedido) {
		this.numeroPedido = numeroPedido;
	}
	
	
}
