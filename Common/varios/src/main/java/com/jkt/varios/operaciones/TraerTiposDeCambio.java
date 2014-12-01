package com.jkt.varios.operaciones;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.PersistentEntity;
import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.Moneda;
import com.jkt.varios.dominio.TipoDeCambio;

/**
 * Trae un template de tipo de cambio con todas las monedas para que puedan cargarse sus equivalencias.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerTiposDeCambio extends Operation {

	private static final String WRITER_TIPO_DE_CAMBIO = "resultado";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		List<PersistentEntity> tiposDeCambio = obtenerTodos(TipoDeCambio.class);
		List<PersistentEntity> monedas = obtenerTodos(Moneda.class);
		TipoDeCambio tipoCambioActual;
		Moneda monedaActual;
		if (tiposDeCambio.isEmpty()) {
			/*
			 * Esto sucederá la primera vez solamente.
			 * Si no se cargo nunca algun tipo de cambio, se mostraran todas las monedas disponibles en formato de tipo de cambio.
			 */
			for (PersistentEntity persistentEntity : monedas) {
				monedaActual=(Moneda) persistentEntity;
				notificarNuevoTipoDeCambio(monedaActual);
			}
		}else{
			/*
			 * Notifico todos los tipos de cambio con sus correspondientes datos.
			 */
			List<Long> idsExistentes=new ArrayList<Long>();
			for (PersistentEntity persistentEntity : tiposDeCambio) {
				tipoCambioActual=(TipoDeCambio) persistentEntity;
				notificarObjeto(WRITER_TIPO_DE_CAMBIO, tipoCambioActual);
				
				idsExistentes.add(tipoCambioActual.getMoneda().getId());
			}
			
			/*
			 * Si se agregaron nuevas monedas, necesito notificar la misma con datos vacios en formato de tipo de cambio.
			 */
			for (PersistentEntity persistentEntity : monedas) {
				monedaActual=(Moneda) persistentEntity;
				if (!idsExistentes.contains(monedaActual.getId())) {
					notificarNuevoTipoDeCambio(monedaActual);
				}
			}
			
		}
		
		
	}

	protected void notificarNuevoTipoDeCambio(Moneda monedaActual) {
		TipoDeCambio nuevoTipoDeCambio = new TipoDeCambio();
		nuevoTipoDeCambio.setCotizacion(0);
		nuevoTipoDeCambio.setFecha(new Date());
		nuevoTipoDeCambio.setMoneda(monedaActual);
		notificarObjeto(WRITER_TIPO_DE_CAMBIO, nuevoTipoDeCambio);
	}

}
