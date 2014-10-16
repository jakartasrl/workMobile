package com.jkt.erp.impuestos.operaciones;

import java.util.Map;

import com.jkt.dominio.Container;
import com.jkt.operaciones.Operation;

/**
 * Recupera los comportamientos que puede obtener un impuesto
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerComportamientosImpuesto extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		for (int i = 1; i < 4; i++) {
			notificarObjeto("resultado", new Container(String.valueOf(i), "PRUEBA_DESCRIPCION_"+i));
		}

	}

}
