package com.jkt.operaciones;

import java.util.List;
import java.util.Map;

import com.jkt.dominio.Filtro;
import com.jkt.dominio.PersistentEntity;
import com.jkt.transformers.Notificacion;

/**
 * Operacion para recuperar un elemento dado tales filtros.
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class OperacionHelper extends Operation {

	public void execute(Map<String, Object> aParams) throws Exception {
		Filtro filtro = (Filtro) aParams.get("objeto");
		
		
		Map<String, String> mapa = filtro.valoresToMap();
		
//		busca en el repo (contra la base)
		List<PersistentEntity> list = this.getServiceRepository().getByProperties(Class.forName(filtro.getClase()), mapa);

//		Notifica resultados
		for (PersistentEntity persistentEntity : list) {
			this.notificarObjecto(Notificacion.getNew("salida2", persistentEntity));
		}
	}

}
