package com.jkt.pedido.dominio;

import java.util.Date;

import lombok.Data;

/**
 * Representa una instancia en la historia de un {@link Pedido}
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class PedidoHistorial extends Pedido {

	private Pedido pedido;
	private Date fechaVersionado;
		
}
