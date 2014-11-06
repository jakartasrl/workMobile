package com.jkt.cotizador.operaciones;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.neo4j.cypher.internal.compiler.v2_1.commands.expressions.Collection;

import com.jkt.dominio.ComprobanteVentaDet;
import com.jkt.dominio.Cotizacion;
import com.jkt.dominio.Pedido;
import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.Especificacion;

/**
 * <p>Tomando una cotizacion copia las propiedades a un pedido.</p>
 * <p>En resumen, una cotización es una descripcion de elementos articulos, precios, unidades de medida y otros datos.</p>
 * <p>Un pedido contiene la misma información que una cotización pero pasa a interactuar con un cliente, es decir, es el cliente quien decide si se concreta la venta.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class GenerarPedidoUsandoCotizacion extends Operation {

	private static final String OID_COTIZACION = "oid".toUpperCase();
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams.get(OID_COTIZACION));
		String oidCotizacion = (String) aParams.get(OID_COTIZACION);
		
		Cotizacion cotizacion = (Cotizacion) obtener(Cotizacion.class, oidCotizacion);
		
		Pedido pedido = new Pedido();
		
		BeanUtils.copyProperties(pedido, cotizacion);
		
		
//		cotizacion.setArchivos((List<Especificacion>) Collection.empty());
		
		List<Especificacion> archivos = cotizacion.getArchivos();
		for (Especificacion especificacion : archivos) {
			pedido.agregarEspecificacion(especificacion);
		}
		cotizacion.setArchivos(new ArrayList<Especificacion>());
		
		
		List<ComprobanteVentaDet> detalles = cotizacion.getDetalles();
		for (ComprobanteVentaDet comprobanteVentaDet : detalles) {
			pedido.agregarDetalle(comprobanteVentaDet);
		} 
		cotizacion.setDetalles(new ArrayList<ComprobanteVentaDet>());
		
		pedido.setId(0L);
		guardar(pedido);
	}

}