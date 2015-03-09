package com.jkt.operaciones;

import java.util.List;
import java.util.Map;

@SuppressWarnings({"rawtypes","unchecked"})
public class GuardarListaWeb extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		List list = (List) aParams.get("listPersistentes");
		serviceRepository.guardarObjetos(list);
		notificarObjeto("", list);
	}

}
