package com.jkt.cotizador.operaciones;

import java.util.ArrayList;
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
		List<PersistentEntity> listaItems=new ArrayList<PersistentEntity>();

		Filtro f = new Filtro("estado", Cotizacion.Estado.PENDIENTE.toString(), "igual", TiposDeDato.STRING_TYPE);
		Filtro f2 = new Filtro("activo", "true", "igual", TiposDeDato.BOOLEAN_TYPE);
		List<PersistentEntity> listaDeCotizacionesPendientes = serviceRepository.getByProperties(Cotizacion.class, Arrays.asList(f,f2));
		
		Cotizacion cotizacion;
		for (PersistentEntity persistentEntity : listaDeCotizacionesPendientes) {
			cotizacion=(Cotizacion) persistentEntity;
			
			int nroDetalle=0;
			for (ComprobanteVentaDet comprobanteVentaDet : cotizacion.getDetalles()) {
				
				comprobanteVentaDet.setNumero(
							String.valueOf(++nroDetalle)
						);
				if(this.getTipoCliente()==CLIENTE_DELPHI){
					notificarObjeto("items", comprobanteVentaDet);
				}else{
					listaItems.add(comprobanteVentaDet);
				}
			}
		}
		
		if(this.getTipoCliente()==CLIENTE_HTML){
			notificarObjeto("", listaItems);
		}
		
	}
	
}
