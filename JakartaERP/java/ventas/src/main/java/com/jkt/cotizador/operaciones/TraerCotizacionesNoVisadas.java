package com.jkt.cotizador.operaciones;

import com.jkt.dominio.Cotizacion;


/**
 * Retorna todos los cotizadores que han sido creados pero todavia no han sido revisados, por consiguiente, no tienen una relacion con un modelo de cotizador.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerCotizacionesNoVisadas extends TraerCotizaciones {

	@Override
	protected String getCondition() {
		return Cotizacion.PENDIENTE;
	}

}


