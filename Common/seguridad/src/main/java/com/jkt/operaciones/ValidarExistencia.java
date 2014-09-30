package com.jkt.operaciones;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ValidacionException;

/**
 * Operacion para validar la existencia de dada entidad.
 * 
 * @see Validar
 * @see Operation
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public abstract class ValidarExistencia extends Validar {

	@Override
	protected void manejoDeExistencia(PersistentEntity entity,String className, String codigo) throws ValidacionException {
		manejarExistencia(entity, className, codigo);
	}

}
