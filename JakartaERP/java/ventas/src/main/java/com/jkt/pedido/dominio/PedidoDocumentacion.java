package com.jkt.pedido.dominio;

import lombok.Data;

import com.jkt.dominio.PersistentEntity;

/**
 * Define la relación entre un documento, un pedido, y el estado del mismo.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class PedidoDocumentacion extends PersistentEntity {

	private Pedido pedido;
	private Documentacion documentacion;
	private boolean entregado = Boolean.FALSE;
	
}
