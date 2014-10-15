package com.jkt.cotizador.operaciones;


/**
 * Recupera todos los cotizadores que han sido creados y tienen ya un modelo de cotizador asignado
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerCotizadoresVisados extends TraerCotizadores {

	@Override
	protected boolean getCondition() {
		return true;
	}

}


