package com.jkt.operaciones;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.PersistentEntity;

public class TraerEntidadesRelacionWeb extends Operation {
	private static final String KEY_ENTIDAD = "entidad";
	private static final String KEY_ENTIDAD_UPPER = "ENTIDAD";
	private static final String KEY_OID = "ID";

	@SuppressWarnings("unchecked")
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		String entidad = (String) aParams.get(KEY_ENTIDAD);
		String entidadWeb = (String) aParams.get(KEY_ENTIDAD_UPPER);
		String id = (String) aParams.get(KEY_OID);
		
		List<PersistentEntity> obtenerTodos=new ArrayList<PersistentEntity>();
		if (id == null || id.isEmpty()) {
			
			if (entidad==null) {
				if (entidadWeb!=null) {
					obtenerTodos = obtenerTodos((Class<? extends PersistentEntity>) Class.forName(this.getRepositorioClases().getClass(entidadWeb)));
				}
			}else{
				obtenerTodos = obtenerTodos((Class<? extends PersistentEntity>) Class.forName(entidad));
			}
			
			
		}else{
			PersistentEntity objeto = obtener((Class<? extends PersistentEntity>) Class.forName(this.getRepositorioClases().getClass(entidadWeb)), id);
			obtenerTodos.add(objeto);
//			notificarObjeto("", objeto);
//			return;
		}
		
		notificarObjeto("", obtenerTodos);
	}

}
