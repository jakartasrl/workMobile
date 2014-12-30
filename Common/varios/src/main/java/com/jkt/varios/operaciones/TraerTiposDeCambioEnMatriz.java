package com.jkt.varios.operaciones;

import java.util.Map;

import org.hibernate.Query;

import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.Moneda;
import com.jkt.varios.dominio.TipoDeCambio;

/**
 * Trae un template de tipo de cambio con todas las monedas para que puedan cargarse sus equivalencias.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerTiposDeCambioEnMatriz extends Operation {

	private static final int MAX_RESULTS = 5;
	private static final String NOMBRE_ENTIDAD="TipoDeCambio";
	private static final String ATRIBUTO="fecha";
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		String queryHql=String.format("select distinct entity.%s from %s as entity order by entity.%s asc",ATRIBUTO, NOMBRE_ENTIDAD, ATRIBUTO);
		Query query = crearHQL(queryHql);
		query.setMaxResults(MAX_RESULTS);
		
		notificarObjeto("columnas", query.list());
		
		notificarObjeto("monedas", obtenerTodos(Moneda.class));
		notificarObjeto("tiposDeCambio", obtenerTodos(TipoDeCambio.class));
		
	}
	
}
