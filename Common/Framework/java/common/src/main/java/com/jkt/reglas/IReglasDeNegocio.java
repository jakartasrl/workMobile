package com.jkt.reglas;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ReglaDeNegocioException;

public interface IReglasDeNegocio {

	void ejecutar(PersistentEntity entity) throws ReglaDeNegocioException;
	
}
