package com.jkt.pedido.dominio;

import com.jkt.dominio.ComprobanteVenta;

/**
 * <p>Un pedido es una orden de compra que se basa en un presupuesto previamente generado.</p>
 * <p>Este pedido tendrá detalles relacionados.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Pedido extends ComprobanteVenta {
	
	public boolean isPedido(){
		return true;
	}
	
	
}
