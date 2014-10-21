package com.jkt.cotizador.operaciones;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.jkt.constantes.TiposDeDato;
import com.jkt.dominio.Cotizacion;
import com.jkt.dominio.Filtro;
import com.jkt.dominio.PersistentEntity;
import com.jkt.operaciones.Operation;

/**
 * Recupera las cotizaciones que cumplen con determinado filtro.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public abstract class TraerCotizaciones extends Operation {

	private static final String WRITER_COTIZACIONES = "cotizaciones";

	/**
	 * @return Retorna el estado por el cual se realizará el filtro.
	 */
	protected abstract String getCondition();
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		Filtro filtro = new Filtro("estado",getCondition(),"igual",TiposDeDato.STRING_TYPE);
		List<PersistentEntity> cotizadores = serviceRepository.getByProperties(Cotizacion.class, Arrays.asList(filtro));
	
		notificarObjetos(WRITER_COTIZACIONES, cotizadores);
	}

}
