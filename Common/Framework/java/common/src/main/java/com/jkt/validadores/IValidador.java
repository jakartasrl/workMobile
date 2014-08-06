package com.jkt.validadores;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ValidacionException;

public interface IValidador {

	void validar(PersistentEntity entity) throws ValidacionException;
	
}
