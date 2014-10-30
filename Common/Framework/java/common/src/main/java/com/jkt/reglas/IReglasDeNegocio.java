package com.jkt.reglas;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ReglaDeNegocioException;
import com.jkt.excepcion.ValidacionException;

public interface IReglasDeNegocio {

	void ejecutar(PersistentEntity entity) throws ReglaDeNegocioException;
	
}
