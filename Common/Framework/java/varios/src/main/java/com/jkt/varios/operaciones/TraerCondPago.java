package com.jkt.varios.operaciones;

import java.util.Map;

import javax.persistence.EntityNotFoundException;

import com.jkt.operaciones.Operation;
import com.jkt.transformers.Notificacion;
import com.jkt.util.IRepositorioClases;
import com.jkt.varios.dominio.CondPago;
import com.jkt.varios.dominio.CondPagoDet;

/**
 * Operacion que recupera una condicion de pago y todos sus detalles
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerCondPago extends Operation {

	private static final String KEY_OID = "oid";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		String oidEntity = (String) aParams.get(KEY_OID);
		CondPago condicion = (CondPago) serviceRepository.getByOid(CondPago.class, Long.valueOf(oidEntity).longValue());
		if (condicion==null) {
			throw new EntityNotFoundException();
		}
		
		notificarObjecto(Notificacion.getNew("mtCondicionDePago", condicion));
		
		for (CondPagoDet condPagoDet : condicion.getDetalles()) {
			notificarObjecto(Notificacion.getNew("mtDetalleCondicionDePago", condPagoDet));
		}
	}

}


