package com.jkt.erp.impuestos.dominio;

import java.util.List;

import com.jkt.dominio.Descriptible;

/**
 * Representa todos los tipos de impuestos que se asociaran a los clientes y proveedores
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
abstract public class Impuesto extends Descriptible {

	abstract List getCategorias();
	
}
