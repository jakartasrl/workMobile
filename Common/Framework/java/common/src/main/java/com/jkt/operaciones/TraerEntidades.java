package com.jkt.operaciones;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.EntityNotFoundException;
import com.jkt.excepcion.JakartaException;
import com.jkt.transformers.Notificacion;

/**
 * Esta operación recupera entidades.
 * Lo mejor sería utilizar dos operaciones separadas pero desde frontend solicitan esta funcionalidad.
 * Recordar que cada clase debe tener su propia y única responsabilidad, y en este caso la clase tiene dos responsabilidades:
 * 1-recuperar 1 entidad
 * 2-recuperar N entidades.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@OperacionBean
public class TraerEntidades extends Operation {

	private static final String KEY_ENTIDAD = "entidad";
	private static final String KEY_OID = "oid";

	public void execute(Map<String, Object> aParams) throws Exception {
		String nombreClase = (String)aParams.get(KEY_ENTIDAD);
		String oidEntity = (String) aParams.get(KEY_OID);
		
		List<PersistentEntity> allElements;
		if (oidEntity==null) {
			allElements = serviceRepository.getAll(Class.forName(nombreClase));
		}else if(oidEntity.isEmpty()){
			throw new JakartaException("Debe completar el campo ID.");
		}else{
			allElements = new ArrayList<PersistentEntity>();
			PersistentEntity entity = serviceRepository.getByOid(Class.forName(nombreClase), Long.valueOf(oidEntity).longValue());
			
			if (entity==null) {
				throw new EntityNotFoundException("No existe la entidad solicitada con el ID recibido.");
			}
			allElements.add(entity);
		}
		
		for (PersistentEntity persistentEntity : allElements) {
			this.notificarObjecto(Notificacion.getNew("resultado", persistentEntity));
		}
		
	}
	
	/*
	 * 
	public void execute(Map<String, Object> aParams) throws Exception {
		String nombreClase = (String)aParams.get(KEY_ENTIDAD);
		String oidEntity = (String) aParams.get(KEY_OID);
		

		List<PersistentEntity> allElements = serviceRepository.getAll(Class.forName(nombreClase));
		
		for (PersistentEntity persistentEntity : allElements) {
			this.notificarObjecto(Notificacion.getNew("resultado", persistentEntity));
		}
		
	}
	*/
}
