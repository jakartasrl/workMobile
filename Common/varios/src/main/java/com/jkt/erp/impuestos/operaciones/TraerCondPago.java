package com.jkt.erp.impuestos.operaciones;

import java.util.Map;

import javax.persistence.EntityNotFoundException;

import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.CondPago;

public class TraerCondPago extends Operation {
	
	private static final String OID = "oid".toUpperCase();

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		CondPago condPago = (CondPago) obtener(CondPago.class, (String) aParams.get(OID));
		
		if (condPago==null) {
			throw new EntityNotFoundException();
		}
		
		notificarObjeto("", condPago);
					
	}

}
