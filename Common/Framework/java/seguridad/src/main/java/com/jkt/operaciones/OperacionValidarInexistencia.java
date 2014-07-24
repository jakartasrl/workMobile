package com.jkt.operaciones;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.EntityNotFoundException;

public class OperacionValidarInexistencia extends OperacionValidar {

	@Override
	protected void manejarExistencia(PersistentEntity entity, String className, String codigo) throws EntityNotFoundException {
		if (entity!=null) {
			throw new RuntimeException(String.format("La entidad de clase %s y codigo %s ya existe.",className,codigo));
		}
	}

}
