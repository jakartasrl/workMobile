package com.jkt.varios.operaciones;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.jkt.dominio.PersistentEntity;
import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.Moneda;
import com.jkt.varios.dominio.TipoDeCambio;

/**
 * Recupera los ultimos tipos de cambios tomando como parametro la fecha.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerUltimosTiposDeCambio extends Operation {

	private static final String WRITER_TIPO_CAMBIO = "tipoCambio";
	private static final String HQL = "from TipoDeCambio as t where t.moneda.id= :moneda order by t.fecha desc";
	private static final int COTIZACION_DEFAULT = 1;

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		List<PersistentEntity> monedas = obtenerTodos(Moneda.class);
		
		List<TipoDeCambio> nuevosTiposDeCambio=new ArrayList<TipoDeCambio>();
		
		Moneda monedaActual;
		TipoDeCambio tipoCambio = null;
		for (PersistentEntity persistentEntity : monedas) {
			monedaActual=(Moneda) persistentEntity;
			
			if (!monedaActual.isActivo()) {
				continue;
			}
			
			Query query = crearHQL(HQL);
			query.setParameter("moneda", monedaActual.getId());
			
			List list = query.list();
			if (!list.isEmpty()) {
				tipoCambio=(TipoDeCambio) list.get(0);
			}else{
				tipoCambio = new TipoDeCambio();
				
				tipoCambio.setCotizacion(COTIZACION_DEFAULT);
				tipoCambio.setFecha(new Date());
				tipoCambio.setMoneda(monedaActual);
				
				nuevosTiposDeCambio.add(tipoCambio);
			}

			notificarObjeto(WRITER_TIPO_CAMBIO, tipoCambio);
			
		}
		
		/*
		 * Guardando tipos de cambios para que ya queden registrados.
		 * Esto es para el caso en que se agrega una nueva moneda y la misma no tiene aun un tipo de cambio configurado.
		 */
		for (TipoDeCambio tipoDeCambio : nuevosTiposDeCambio) {
			guardar(tipoDeCambio);
		}
		
	}

}
