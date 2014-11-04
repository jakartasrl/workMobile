package com.jkt.varios.validadores;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.operaciones.ValidacionDeNegocio;
import com.jkt.varios.dominio.CondPago;
import com.jkt.varios.dominio.CondPagoDet;

/**
 * Regla de negocio de la entidad {@link CondPago}
 * 
 * @see CondPago
 * @author Leonel Suarez - Jakarta SRL
 */
public class ValidadorCondPago extends ValidacionDeNegocio {

	private final double total=100;
	
	public void validar(PersistentEntity entity) throws ValidacionDeNegocioException {
		CondPago condicionDePago = (CondPago) entity;
		
		/*
		 * Primera validacion, el total de detalles debe sumar un % de 100.
		 */
		double acumulado=0;
		for (CondPagoDet condPagoDet : condicionDePago.getDetalles()) {
			acumulado+=condPagoDet.getPorcentaje();
		}
		
		if (total!=acumulado) {
			throw new ValidacionDeNegocioException("Error en los detalles de condicion de pago. La sumatoria no es 100%.");
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
			throw new ValidacionDeNegocioException("Solo, y solo uno de los valores base debe ser verdadero.");
		}
		
		
		
	}

}
