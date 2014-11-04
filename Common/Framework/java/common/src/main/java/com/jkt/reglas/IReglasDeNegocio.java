package com.jkt.reglas;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ValidacionDeNegocioException;

public interface IReglasDeNegocio {

	void ejecutar(PersistentEntity entity) throws ValidacionDeNegocioException;
	
}
