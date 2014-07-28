package com.jkt.operaciones;

import java.util.List;
import java.util.Map;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.PersistentEntity;
import com.jkt.transformers.Notificacion;

@OperacionBean
public class OperacionTraerEntidades extends Operation {

	public void execute(Map<String, Object> aParams) throws Exception {
		String nombreClase = (String)aParams.get("entidad");
		List<PersistentEntity> allElements = this.serviceRepository.recuperarTodos(Class.forName(nombreClase));
		
		for (PersistentEntity persistentEntity : allElements) {
			this.notificarObjecto(Notificacion.getNew("resultado", persistentEntity));
		}
		
	}

}
