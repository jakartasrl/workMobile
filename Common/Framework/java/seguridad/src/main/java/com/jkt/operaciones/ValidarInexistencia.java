package com.jkt.operaciones;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.EntityNotFoundException;

public class ValidarInexistencia extends Validar {

	@Override
	protected void manejarExistencia(PersistentEntity entity, String className, String codigo) throws EntityNotFoundException {
		if (entity!=null) {
//			throw new RuntimeException(String.format("La entidad de clase %s y codigo %s ya existe.",className,codigo));
			throw new EntityNotFoundException("Codigo existente.");
//			throw new EntityNotFoundException(String.format("Codigo existente.Ya existe un '%s' con el codigo '%s.'",className,codigo));
		}
	}

}
