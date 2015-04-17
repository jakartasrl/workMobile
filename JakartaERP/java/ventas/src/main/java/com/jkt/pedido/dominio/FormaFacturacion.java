package com.jkt.pedido.dominio;

import lombok.Data;

import com.jkt.dominio.PersistentEntity;
import com.jkt.varios.dominio.CondPago;

/**
 * Representa a las formas de facturar un item de presupuesto/pedido.
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class FormaFacturacion extends PersistentEntity {

	private String descripcion;
	private int porcentaje;
	private double importe;
	private CondPago condicionPago;

}
