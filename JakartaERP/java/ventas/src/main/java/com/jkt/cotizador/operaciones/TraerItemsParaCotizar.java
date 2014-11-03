package com.jkt.cotizador.operaciones;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.jkt.constantes.TiposDeDato;
import com.jkt.dominio.ComprobanteVentaDet;
import com.jkt.dominio.Cotizacion;
import com.jkt.dominio.Filtro;
import com.jkt.dominio.PersistentEntity;
import com.jkt.operaciones.Operation;

/**
 * Recupera todos los items de todas las cotizaciones pendientes a cotizar.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerItemsParaCotizar extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {

		Filtro f = new Filtro("estado", Cotizacion.Estado.PENDIENTE.toString(), "igual", TiposDeDato.STRING_TYPE);
		List<PersistentEntity> listaDeCotizacionesPendientes = serviceRepository.getByProperties(Cotizacion.class, Arrays.asList(f));
		
		Cotizacion cotizacion;
		for (PersistentEntity persistentEntity : listaDeCotizacionesPendientes) {
			cotizacion=(Cotizacion) persistentEntity;
			
			int nroDetalle=0;
			for (ComprobanteVentaDet comprobanteVentaDet : cotizacion.getDetalles()) {
				
				comprobanteVentaDet.setNumero(
						String.valueOf(comprobanteVentaDet.getComprobanteVenta().getNro()).
						concat("-").
						concat(String.valueOf(++nroDetalle)));
				
				notificarObjeto("items", comprobanteVentaDet);
			}
		}
		
	}

}
