package com.jkt.operaciones;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.Filtros;
import com.jkt.dominio.PersistentEntity;
import com.jkt.transformers.Notificacion;
import com.jkt.util.RepositorioClases;

/**
 * Operacion para recuperar un elemento dado tales filtros.
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class Helper extends Operation {

	private static final String KEY_ENTIDAD = "entidad";
	private static final String KEY_FILTROS = "filtros";

	public void execute(Map<String, Object> aParams) throws Exception {
		String nombreEntidad=(String) aParams.get(KEY_ENTIDAD);
		String className = RepositorioClases.getClass(nombreEntidad);
		List objetos = recuperarObjeto(aParams);
		
		List<PersistentEntity> list = getServiceRepository().getByProperties(Class.forName(className), objetos);

		for (PersistentEntity persistentEntity : list) {
			this.notificarObjecto(Notificacion.getNew("resultado", persistentEntity));
		}
	}
	
	private List recuperarObjeto(Map<String, Object> aParams) {
		List object;
		if (aParams.get(KEY_FILTROS)  instanceof List) {
			object = (List) aParams.get(KEY_FILTROS);
		}else{
			object = new ArrayList<Object>();
			object.add(aParams.get(KEY_FILTROS));
		}
		return object;
	}

}
