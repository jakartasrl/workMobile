package com.jkt.operaciones;

import java.util.Map;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.EntityNotFoundException;
import com.jkt.transformers.Notificacion;

/**
 * Operacion generica para validar existencia, o no existencia.
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public abstract class OperacionValidar extends Operation{

	private static final String CODIGO_FIELD = "codigo";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		/*
		 * Recupera de los parametros el codigo y el nombre de la entidad
		 */
		String codigo=(String) aParams.get(CODIGO_FIELD);
		String className=(String) aParams.get("entidad");
		
		//Realiza la consulta a la base
		PersistentEntity objectRetrieved = serviceRepository.getUniqueByProperty(Class.forName(className), CODIGO_FIELD, codigo);
		
		manejarExistencia(objectRetrieved,className, codigo);
	}
	
	protected abstract void manejarExistencia(PersistentEntity entity,String className, String codigo)throws EntityNotFoundException;

}
