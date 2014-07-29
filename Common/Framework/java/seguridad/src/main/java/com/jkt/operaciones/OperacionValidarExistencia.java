package com.jkt.operaciones;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.EntityNotFoundException;
import com.jkt.transformers.Notificacion;

/**
 * Operacion para validar la existencia de dada entidad.
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class OperacionValidarExistencia extends OperacionValidar {

	@Override
	protected void manejarExistencia(PersistentEntity entity, String className,String codigo) throws EntityNotFoundException {
		if (entity==null) {
			throw new EntityNotFoundException(String.format("No existe la entidad de tipo %s con codigo %s.", className, codigo));
		}
		notificarObjecto(Notificacion.getNew("resultado", entity));
	}

}
