package com.jkt.erp.impuestos.operaciones;

import java.util.List;
import java.util.Map;

import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.impuestos.dominio.CategoriaImpuesto;
import com.jkt.erp.impuestos.dominio.Impuesto;
import com.jkt.excepcion.EntityNotFoundException;
import com.jkt.operaciones.Operation;
import com.jkt.transformers.Notificacion;

/**
 * Recupera todos los impuestos existentes.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerImpuestos extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		String oid = (String) aParams.get("OID".toUpperCase());
		Impuesto impuesto = (Impuesto) serviceRepository.getByOid(Impuesto.class, Long.valueOf(oid).longValue());
		
		if (impuesto==null) {
			throw new EntityNotFoundException("No existe el impuesto con identificador "+oid);
		}

		notificarObjecto(Notificacion.getNew("impuesto", impuesto));
		
		List<CategoriaImpuesto> categorias = impuesto.getCategorias();
		for (CategoriaImpuesto categoriaImpuesto : categorias) {
			notificarObjecto(Notificacion.getNew("categorias", categoriaImpuesto));
		}
		
	}

}
