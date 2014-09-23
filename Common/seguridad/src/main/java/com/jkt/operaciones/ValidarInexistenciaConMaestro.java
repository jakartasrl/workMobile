package com.jkt.operaciones;

import java.util.Map;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;

/**
 * Operacion para validar la existencia de dada entidad.
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class ValidarInexistenciaConMaestro extends ValidarInexistencia{

	@Override
	protected PersistentEntity manejarFiltros(Map<String, Object> aParams) throws ClassNotFoundException, JakartaException {
		return manejarFiltrosComplejos(aParams);
	}
	

}
