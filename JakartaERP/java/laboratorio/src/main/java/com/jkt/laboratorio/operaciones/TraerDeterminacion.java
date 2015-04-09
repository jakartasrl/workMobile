package com.jkt.laboratorio.operaciones;

import java.util.Map;

import com.jkt.laboratorio.dominio.Determinacion;
import com.jkt.operaciones.Operation;

public class TraerDeterminacion extends Operation {
	
	private static final String OID = "oid".toUpperCase();
	private static final String WRITER_DETERMINACION = "DETERMINACION";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		validarEntrada(aParams.get(OID));
		Determinacion determinacion = (Determinacion) obtener(Determinacion.class, (String) aParams.get(OID));
		
		notificarObjeto(WRITER_DETERMINACION, determinacion);
		
	}

}
