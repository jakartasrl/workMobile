package com.jkt.validadores;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ValidacionDeNegocioException;

public interface IValidador {

	void validar(PersistentEntity entity) throws ValidacionDeNegocioException;
	
}
