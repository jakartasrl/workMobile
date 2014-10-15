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
 * Recupera los cotizadores que cumplen con determinado filtro.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public abstract class TraerCotizadores extends Operation {

	/**
	 * @return boolean valor true si la condicion es: visado, valor false si la condicion es: no visado
	 */
	protected abstract boolean getCondition();
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		Filtro filtro = new Filtro("revisado",String.valueOf(getCondition()),"igual",TiposDeDato.BOOLEAN_TYPE);
		List<PersistentEntity> cotizadores = serviceRepository.getByProperties(Cotizador.class, Arrays.asList(filtro));
	
		notificarObjetos("cotizadores", cotizadores);
	}

}
