package com.jkt.presupuesto.operaciones;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.jkt.cotizador.dominio.CotizadorDet;
import com.jkt.dominio.ComprobanteVentaDet;
import com.jkt.dominio.Cotizacion;
import com.jkt.dominio.CotizacionDet;
import com.jkt.excepcion.JakartaException;
import com.jkt.operaciones.Operation;

/**
 * Muestra los datos de una cotizacion previamente persistida para que se pueda a partir de esta misma generar un presupuesto
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerCotizacionParaPresupuesto extends Operation {

	private static final String WRITER_DETALLES = "detalles";
	private static final String WRITER_COTIZACION = "cotizacion";
	private static final String OID_COTICAZION = "oid_cotizacion".toUpperCase();

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		validarEntrada(aParams.get(OID_COTICAZION));
		
		Cotizacion cotizacion = (Cotizacion) obtener(Cotizacion.class, (String)aParams.get(OID_COTICAZION));
		
		/*
		 * Validar todos los items
		 */
		validarEstadoDeItems(cotizacion);
		
		notificarObjeto(WRITER_COTIZACION, cotizacion);
		
		mostrarItems(cotizacion.getDetalles());
		
	}


	/**
	 * Muestra los items de la cotización uno por uno, retornando los detalles generados por el cotizador
	 * 
	 */
	private void mostrarItems(List<CotizacionDet> detalles) {

		/*
		 * A partir de un detalle de cotizacion, puedo acceder a su cotizador.
		 * A partir del cotizador puedo acceder a los detalles.
		 * A partir del detalle de cotizador puedo acceder a sus costos, unidades de medida y demas asignados en el cotizador
		 */
		
		for (CotizacionDet detalleCotizacion : detalles) {
			List<CotizadorDet> detallesCotizador = detalleCotizacion.getCotizador().getDetalles();
			
			/*
			 * Calcular el total de los items
			 */
			double totalCotizado=0;
			for (CotizadorDet cotizadorDet : detallesCotizador) {
				totalCotizado+=cotizadorDet.getImporteVenta();
			}
			
			detalleCotizacion.setTotalCotizado(totalCotizado);
			
			//Mostrar detalle
			notificarObjeto(WRITER_DETALLES, detalleCotizacion);
		}
		
	}


	/**
	 * Valida que todos los items de la cotizacion tengan estado "cotizado y autorizado"
	 * @throws JakartaException Cuando un item no tiene estado autorizado. 
	 * 
	 */
	private void validarEstadoDeItems(Cotizacion cotizacion) throws JakartaException {
		for (CotizacionDet cotizacionDetalle : cotizacion.getDetalles()) {
			if (CotizacionDet.Estado.AUTORIZADO.getId()!=cotizacionDetalle.getEstadoId()) {
				throw new JakartaException("Uno de los items de la cotización seleccionada no posee el estado necesario para generar un presupuesto a partir de la misma.");
			}
		}
	}

}
