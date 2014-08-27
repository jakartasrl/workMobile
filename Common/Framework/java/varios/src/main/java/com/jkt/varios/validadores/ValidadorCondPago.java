package com.jkt.varios.validadores;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ValidacionException;
import com.jkt.validadores.IValidador;
import com.jkt.varios.CondPago;
import com.jkt.varios.CondPagoDet;

/**
 * Regla de negocio de la entidad {@link CondPago}
 * 
 * @see CondPago
 * @author Leonel Suarez - Jakarta SRL
 */
public class ValidadorCondPago implements IValidador {

	private final double total=100;
	
	public void validar(PersistentEntity entity) throws ValidacionException {
		CondPago condicionDePago = (CondPago) entity;
		
		/*
		 * Primera validacion, el total de detalles debe sumar un % de 100.
		 */
		double acumulado=0;
		for (CondPagoDet condPagoDet : condicionDePago.getDetalles()) {
			acumulado+=condPagoDet.getPorcentaje();
		}
		
		if (total!=acumulado) {
			throw new ValidacionException("Error en los detalles de condicion de pago. La sumatoria no es 100%.");
		}
		
		/*
		 * Segunda validacion, una propiedad, y solo una debe ser TRUE
		 * 
		 */
		boolean b1=condicionDePago.isBaseFechaFactura();
		boolean b2=condicionDePago.isBaseFechaRecep();
		
		//XOR
		if( ( b1 && !b2 ) || ( !b1 && b2 ) ){
			//passing validation
		}else{
			throw new ValidacionException("Solo, y solo uno de los valores base debe ser verdadero.");
		}
		
		
		
	}

}
