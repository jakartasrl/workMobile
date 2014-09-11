package com.jkt.erp.impuestos.operaciones;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.Container;
import com.jkt.operaciones.Operation;
import com.jkt.transformers.Notificacion;

/**
 * Recupera los comportamientos que puede obtener un impuesto
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerComportamientosImpuesto extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {

		for (int i = 1; i < 4; i++) {
			this.notificarObjecto(Notificacion.getNew("resultado", new Container(""+i, "PRUEBA_DESCRIPCION_"+i)));
		}

	}

}
