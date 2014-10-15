package com.jkt.cotizador.operaciones;


/**
 * Retorna todos los cotizadores que han sido creados pero todavia no han sido revisados, por consiguiente, no tienen una relacion con un modelo de cotizador.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerCotizadoresNoVisados extends TraerCotizadores {

	@Override
	protected boolean getCondition() {
		return false;
	}

}


