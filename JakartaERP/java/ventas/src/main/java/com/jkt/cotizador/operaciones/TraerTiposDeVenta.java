package com.jkt.cotizador.operaciones;

import java.util.Arrays;
import java.util.Map;

import com.jkt.dominio.Container;
import com.jkt.operaciones.Operation;

/**
 * <p>Esta operación retorna una lista de posibles tipos de venta.</p>
 * <p>Este tipo de venta estará ligado a un detalle de cotización o pedido.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerTiposDeVenta extends Operation {

	private static final String WRITER_ENTIDADES = "entidades";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		notificarObjetos(WRITER_ENTIDADES, Arrays.asList(new Container("1", "Fabricacion"), new Container("2", "Reparacion"), new Container("3", "Service")));
	}

}
