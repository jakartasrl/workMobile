package com.jkt.pedido.dominio;

import lombok.Data;

import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.articulos.Producto;
import com.jkt.varios.dominio.CondPago;

/**
 * Representa a las formas de facturar un item de presupuesto/pedido.
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class FormaFacturacion extends PersistentEntity {

	private Producto producto;
	private String descripcion;
	private double porcentaje;
	private double importe;
	private CondPago condicionPago;

}
