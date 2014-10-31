package com.jkt.erp.operaciones;

import java.util.List;
import java.util.Map;

import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.varios.Cliente;
import com.jkt.operaciones.Operation;

public class WebOperaciones extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		List<PersistentEntity> obtenerTodos = obtenerTodos(Cliente.class);
		notificarObjeto("",obtenerTodos.get(0));
	}
}
