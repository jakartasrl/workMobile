package com.jkt.operaciones;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ValidacionException;
import com.jkt.transformers.Notificacion;

/**
 * Operacion para validar la existencia de dada entidad.
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class ValidarExistencia extends Validar {

	@Override
	protected void manejarExistencia(PersistentEntity entity, String className,String codigo) throws ValidacionException {
		if (entity==null) {
			throw new ValidacionException(String.format("El codigo solicitado no existe.", className, codigo));
		}
		notificarObjecto(Notificacion.getNew("resultado", entity));
	}

}
