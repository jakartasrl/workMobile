package com.jkt.cotizador.operaciones;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.jkt.constantes.TiposDeDato;
import com.jkt.cotizador.dominio.Cotizador;
import com.jkt.dominio.Filtro;
import com.jkt.dominio.PersistentEntity;
import com.jkt.operaciones.Operation;

/**
 * Recupera todos los cotizadores que han sido creados pero no tienen asignado un modelo de cotizador.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerCotizadoresNoVisados extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		Filtro filtro = new Filtro("revisado","true","igual",TiposDeDato.STRING_TYPE);
		List<PersistentEntity> cotizadores = serviceRepository.getByProperties(Cotizador.class, Arrays.asList(filtro));
	
		notificarObjetos("cotizadores", cotizadores);
		
	}

}


