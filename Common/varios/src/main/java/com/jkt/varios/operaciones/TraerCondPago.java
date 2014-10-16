package com.jkt.varios.operaciones;

import java.util.Map;

import javax.persistence.EntityNotFoundException;

import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.CondPago;
import com.jkt.varios.dominio.CondPagoDet;

/**
 * Operacion que recupera una condicion de pago y todos sus detalles
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerCondPago extends Operation {

	private static final String KEY_OID = "oid".toUpperCase();

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		String oidEntity = (String) aParams.get(KEY_OID);
		CondPago condicion = (CondPago) obtener(CondPago.class, oidEntity);
		if (condicion==null) {
			throw new EntityNotFoundException();
		}
		
		notificarObjeto("condicion", condicion);
		
		for (CondPagoDet condPagoDet : condicion.getDetalles()) {
			notificarObjeto("detalle", condPagoDet);
		}
	}

}


