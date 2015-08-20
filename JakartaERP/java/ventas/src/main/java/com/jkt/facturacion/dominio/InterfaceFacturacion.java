package com.jkt.facturacion.dominio;

import java.util.Date;

import lombok.Data;

import com.jkt.dominio.PersistentEntity;
import com.jkt.pedido.dominio.Pedido;
import com.jkt.pedido.dominio.TareaPedido;

/**
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class InterfaceFacturacion extends PersistentEntity {

	private Pedido pedido;

	//	private Evento evento; //Representa a un evento de q tipo? una tarea de pedido?? 
	private TareaPedido evento; //Representa a un evento de q tipo? una tarea de pedido?? 
	
	private long itemPedidoJakartaERP;
	private long oidComprobanteFactura;
	private boolean facturado;
	private Date fechaFactura;
	private String nroFactura;
	private String rutaPDFFactura;

}
