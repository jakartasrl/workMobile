package com.jkt.operaciones;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ValidacionException;

public abstract class ValidarInexistencia extends Validar {

	@Override
	protected void manejoDeExistencia(PersistentEntity entity,String className, String codigo) throws ValidacionException {
		manejarInexistencia(entity, className, codigo);
	}
	
}
