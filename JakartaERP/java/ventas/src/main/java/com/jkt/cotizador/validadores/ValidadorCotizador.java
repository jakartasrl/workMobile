package com.jkt.cotizador.validadores;

import com.jkt.cotizador.dominio.Cotizador;
import com.jkt.dominio.ComprobanteVentaDet;
import com.jkt.dominio.CotizacionDet;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.operaciones.ValidacionDeNegocio;

public class ValidadorCotizador extends ValidacionDeNegocio {

	public void validar(PersistentEntity entity) throws ValidacionDeNegocioException {
		
		Cotizador cotizador=(Cotizador) entity;
		
		cotizador.getItem().setEstadoId(CotizacionDet.Estado.COTIZADO_NO_AUTORIZADO.getId());

		
//		if (cotizador.getId()==0) {
//			cotizador.getItem().setEstadoId(ComprobanteVentaDet.Estado.AUTORIZADO.getId());
//		}
		
//		if (Integer.valueOf(cotizador.getCodigoEstado()).intValue()==ComprobanteVentaDet.Estado.PENDIENTE_A_COTIZAR.getId()) {
//		}
//		
		
	}

}

