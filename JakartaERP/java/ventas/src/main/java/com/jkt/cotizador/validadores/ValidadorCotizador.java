package com.jkt.cotizador.validadores;

import com.jkt.cotizador.dominio.Cotizador;
import com.jkt.dominio.ComprobanteVentaDet;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.operaciones.ValidacionDeNegocio;

public class ValidadorCotizador extends ValidacionDeNegocio {

	public void validar(PersistentEntity entity) throws ValidacionDeNegocioException {
		
		Cotizador cotizador=(Cotizador) entity;
		if (Integer.valueOf(cotizador.getCodigoEstado()).intValue()==ComprobanteVentaDet.Estado.PENDIENTE_A_COTIZAR.getId()) {
			cotizador.getItem().setEstadoId(ComprobanteVentaDet.Estado.AUTORIZADO.getId());
		}
		
		
	}

}

