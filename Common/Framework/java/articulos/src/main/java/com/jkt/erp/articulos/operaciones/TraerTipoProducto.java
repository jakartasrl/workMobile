package com.jkt.erp.articulos.operaciones;

import java.util.Iterator;
import java.util.Map;

import com.jkt.erp.articulos.TipoProducto;
import com.jkt.erp.articulos.TipoProductoDet;
import com.jkt.operaciones.Operation;
import com.jkt.transformers.Notificacion;

/**
 * Recupera todos los tipos de producto existentes, y sus correspondientes detalles
 * 
 * @author DHS- Jakarta SRL
 */
public class TraerTipoProducto extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		TipoProducto tipo = (TipoProducto) aParams.get("objeto");
		
		notificarObjecto(Notificacion.getNew("out1", tipo));
		Iterator it = tipo.getCaracteristicas().iterator();
		while(it.hasNext()){
			TipoProductoDet det = (TipoProductoDet) it.next();
			notificarObjecto(Notificacion.getNew("out2", det));
		}

	}

}
