package com.jkt.cotizador.operaciones;

import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.jkt.dominio.Cotizacion;
import com.jkt.dominio.Pedido;
import com.jkt.operaciones.Operation;

/**
 * <p>Tomando una cotizacion copia las propiedades a un pedido.</p>
 * <p>En resumen, una cotización es una descripcion de elementos articulos, precios, unidades de medida y otros datos.</p>
 * <p>Un pedido contiene la misma información que una cotización pero pasa a interactuar con un cliente, es decir, es el cliente quien decide si se concreta la venta.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class GenerarPedidoUsandoCotizador extends Operation {

	private static final String OID_COTIZADOR = "oid".toUpperCase();
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams.get(OID_COTIZADOR));
		String oidCotizador = (String) aParams.get(OID_COTIZADOR);
		
		Cotizacion cotizacion = (Cotizacion) obtener(Cotizacion.class, oidCotizador);
		
		Pedido pedido = new Pedido();
		
		BeanUtils.copyProperties(pedido, cotizacion);
		
		guardar(pedido);
	}

}