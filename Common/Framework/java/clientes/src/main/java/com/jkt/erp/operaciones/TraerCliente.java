package com.jkt.erp.operaciones;

import java.util.Map;

import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.varios.Cliente;
import com.jkt.operaciones.Operation;
import com.jkt.transformers.Notificacion;

public class TraerCliente extends Operation {

	private static final String WRITER_CLIENTE = "cliente";
	private static final String WRITER_INSCRIPCIONES = "inscripciones";
	private static final String IDENTIFICADOR = "oid";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		String oid = (String) aParams.get(IDENTIFICADOR);
		Cliente cliente = (Cliente) obtener(Cliente.class, Long.valueOf(oid).longValue());
		notificarObjecto(Notificacion.getNew(WRITER_CLIENTE, cliente));
		
		
		
	}

}
