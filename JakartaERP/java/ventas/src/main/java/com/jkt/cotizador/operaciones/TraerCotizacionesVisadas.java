package com.jkt.cotizador.operaciones;

import com.jkt.dominio.Cotizacion;


/**
 * Recupera todos los cotizadores que han sido creados y tienen ya un modelo de cotizador asignado
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerCotizacionesVisadas extends TraerCotizaciones {

	@Override
	protected String getCondition() {
//		return Cotizacion.INICIADA;
		return "";
	}

}


