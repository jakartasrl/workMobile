package com.jkt.operaciones;

import java.util.Map;

import com.jkt.dominio.PersistentEntity;

public class GuardarWeb extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		Object object = aParams.get("objPersistente");
		guardar((PersistentEntity) object);
		notificarObjeto("", object);
	}

}
