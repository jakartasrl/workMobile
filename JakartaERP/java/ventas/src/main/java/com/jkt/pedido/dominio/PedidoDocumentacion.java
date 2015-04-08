package com.jkt.pedido.dominio;

import com.jkt.dominio.PersistentEntity;

/**
 * Define la relación entre un documento, un pedido, y el estado del mismo.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class PedidoDocumentacion extends PersistentEntity {

	private Pedido pedido;
	private Documentacion documentacion;
	private Boolean entregado = Boolean.FALSE;
	
	public Pedido getPedido() {
		return pedido;
	}
	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}
	public Documentacion getDocumentacion() {
		return documentacion;
	}
	public void setDocumentacion(Documentacion documentacion) {
		this.documentacion = documentacion;
	}
	public Boolean getEntregado() {
		return entregado;
	}
	public void setEntregado(Boolean entregado) {
		this.entregado = entregado;
	}

}
