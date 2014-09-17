package com.jkt.operaciones;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ValidacionException;

public class ValidarInexistencia extends Validar {

	@Override
	protected void manejarExistencia(PersistentEntity entity, String className, String codigo) throws ValidacionException {
		if (entity!=null) {
			throw new ValidacionException("Codigo existente.");
		}
	}
}
