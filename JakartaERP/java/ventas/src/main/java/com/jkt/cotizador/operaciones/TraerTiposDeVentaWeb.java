package com.jkt.cotizador.operaciones;

import java.util.Map;

import com.jkt.dominio.ComprobanteVentaDet;
import com.jkt.operaciones.Operation;

/**
 * <p>Esta operación retorna una lista de posibles tipos de venta.</p>
 * <p>Este tipo de venta estará ligado a un detalle de cotización o pedido.</p>
 * 
 * Esta operacion esta hecha para zkoss y su notificacion de varios objetos en uno.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerTiposDeVentaWeb extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		notificarObjeto("", ComprobanteVentaDet.TIPO_VENTA);
	}

}
