package com.jkt.operaciones;

import java.util.List;
import java.util.Map;

import com.jkt.dominio.PersistentEntity;

public class TraerEntidadesRelacionWeb extends Operation {
	private static final String KEY_ENTIDAD = "entidad";

	@SuppressWarnings("unchecked")
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		String object = (String) aParams.get(KEY_ENTIDAD);
		List<? extends PersistentEntity> obtenerTodos = obtenerTodos((Class<? extends PersistentEntity>) Class.forName(object));
		notificarObjeto("", obtenerTodos);
	}

}
