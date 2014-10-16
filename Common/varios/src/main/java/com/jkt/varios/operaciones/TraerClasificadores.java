package com.jkt.varios.operaciones;

import java.util.List;
import java.util.Map;

import com.jkt.dominio.PersistentEntity;
import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.Clasificador;

/**
 * <p>Recupera todos los clasificadores que posee una entidad.</p>
 * <p>Se implementa el patron template method, con lo cual, las subclass implementan metodos hook que son los que proveen de la informacion a esta clase.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public abstract class TraerClasificadores extends Operation {

	private static final String VALUE_ENTIDAD = "entidad";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {

		List<PersistentEntity> clasificadores = serviceRepository.getByProperty(Clasificador.class, VALUE_ENTIDAD, getEntidad());
		
		notificarObjetos("resultado", clasificadores);
		
	}

	/**
	 * <p>Retorna un identificador para que la operacion pueda ir a recuprar los clasificadores correspondientes desde la base de datos.</p>
	 * 
	 * @return Identificador en formato de cadena de la entidad que se desea clasificar
	 */
	protected abstract String getEntidad();
	
}
