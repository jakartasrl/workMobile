package com.jkt.laboratorio.operaciones;

import java.util.Map;

import com.jkt.laboratorio.dominio.Equipo;
import com.jkt.operaciones.Operation;

public class TraerEquipo extends Operation {
	
	private static final String OID = "oid".toUpperCase();
	private static final String WRITER_EQUIPO = "Equipo";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		validarEntrada(aParams.get(OID));
		Equipo equipo = (Equipo) obtener(Equipo.class, (String) aParams.get(OID));
		
		notificarObjeto(WRITER_EQUIPO, equipo);
		
	}

}
