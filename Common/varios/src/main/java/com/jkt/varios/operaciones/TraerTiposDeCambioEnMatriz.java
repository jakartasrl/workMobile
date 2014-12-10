package com.jkt.varios.operaciones;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.jkt.dominio.PersistentEntity;
import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.Moneda;
import com.jkt.varios.dominio.TipoContacto;
import com.jkt.varios.dominio.TipoDeCambio;

/**
 * Trae un template de tipo de cambio con todas las monedas para que puedan cargarse sus equivalencias.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerTiposDeCambioEnMatriz extends Operation {


	private static final String WRITER_TIPO_DE_CAMBIO = "resultado";

	private static final int MAX_RESULTS = 5;
	private static final String NOMBRE_ENTIDAD="TipoDeCambio";
	private static final String ATRIBUTO="fecha";
	
	
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		/*
		 * Query generica que recupera de una entidad una lista ordenada por un atributo dado.
		 * TODO se podria tmb parametrizar el orden asc o desc
		 */
		String queryHql=String.format("select distinct entity.%s from %s as entity order by entity.%s asc",ATRIBUTO, NOMBRE_ENTIDAD, ATRIBUTO);
		
		Query query = crearHQL(queryHql);

		query.setMaxResults(MAX_RESULTS);
		
		
		/*
		 * Notificar esta lista yaaa!!
		 * TODO ver esto
		 */
		List<Date> fechas=new ArrayList<Date>();
		
		for (Object object : query.list()) {
			fechas.add((Date)object);
		}
		
		/*
		 * Ya tenemos las fechas
		 */
		
		List<PersistentEntity> monedas = obtenerTodos(Moneda.class);
		List<PersistentEntity> tiposDeCambio = obtenerTodos(TipoDeCambio.class);

		Map<String, Map<String, TipoDeCambio>> mapa=new HashMap<String, Map<String,TipoDeCambio>>();
		
		/*
		 * Cargo el mapa con las monedas com key y los values mapas vacios.(Estos mapas vacios son, key fecha, value tipoDeCambio)
		 */
		Moneda moneda;
		for (PersistentEntity persistentEntity : monedas) {
			moneda= (Moneda) persistentEntity;
			mapa.put(String.valueOf(moneda.getId()), new HashMap<String, TipoDeCambio>());
		}
		
		
		/*
		 * Tengo un mapa con key ids monedas, y value mapa con key fecha y value tipo de cambio.
		 * es momento de recorrer toooodoooosss los tipos de cambio, y meterlos en el key correspondientes, con la fecha correspondiente.
		 */
		
		TipoDeCambio tipoDeCambio;
		for (PersistentEntity persistentEntity : tiposDeCambio) {
			
		}
		
		System.out.println(fechas.size());
	}
	
}
