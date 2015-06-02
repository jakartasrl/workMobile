package com.jkt.cotizador.validadores;

import com.jkt.cotizador.dominio.Cotizador;
import com.jkt.dominio.CotizacionDet;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.operaciones.ValidacionDeNegocio;

public class ValidadorCotizador extends ValidacionDeNegocio {

	public void validar(PersistentEntity entity) throws ValidacionDeNegocioException {
		
		Cotizador cotizador=(Cotizador) entity;
		
		String codigoEstado = cotizador.getCodigoEstado();
		int estadoId;
		try {
			estadoId = CotizacionDet.Estado.getEstado(Integer.valueOf(codigoEstado)).getId();
		} catch (NumberFormatException e) {
			throw new ValidacionDeNegocioException("El estado de la cotización no es consistente. Compruebe el tipo de datos enviado por favor.");
		} catch (JakartaException e) {
			throw new ValidacionDeNegocioException("El estado de la cotización no es consistente.");
		}
		
		cotizador.getItem().setEstadoId(estadoId);

		
//		if (cotizador.getId()==0) {
//			cotizador.getItem().setEstadoId(ComprobanteVentaDet.Estado.AUTORIZADO.getId());
//		}
		
//		if (Integer.valueOf(cotizador.getCodigoEstado()).intValue()==ComprobanteVentaDet.Estado.PENDIENTE_A_COTIZAR.getId()) {
//		}
//		
		
	}

}

