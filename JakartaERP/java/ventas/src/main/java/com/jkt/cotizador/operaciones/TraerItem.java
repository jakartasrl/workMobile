package com.jkt.cotizador.operaciones;

import java.util.Map;

import com.jkt.cotizador.dominio.Cotizador;
import com.jkt.dominio.CotizacionDet;
import com.jkt.operaciones.Operation;

public class TraerItem extends Operation {

	private static final String OID = "oid".toUpperCase();

	public void execute(Map<String, Object> aParams) throws Exception {
		
		validarEntrada(aParams.get(OID));
		CotizacionDet cotizacionDet = (CotizacionDet) obtener(CotizacionDet.class, (String) aParams.get(OID));
	
		notificarObjeto("", cotizacionDet);

	}

}
