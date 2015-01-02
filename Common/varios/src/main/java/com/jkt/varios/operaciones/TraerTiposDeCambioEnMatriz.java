package com.jkt.varios.operaciones;

import java.util.Map;

import org.hibernate.Query;

import com.jkt.operaciones.Operation;
import com.jkt.transformers.MatrizTransformer;
import com.jkt.varios.dominio.Moneda;
import com.jkt.varios.dominio.TipoDeCambio;

/**
 * <p>Trae un template de tipo de cambio con todas las monedas para que puedan cargarse sus equivalencias.</p>
 * <p><b>Si bien en esta clase no se puede ver la diferencia a una operacion cualquiera, lo que difiere en cuanto a las demas es el
 * transformador utilizado, ya que usa uno que se encarga de mostrar los datos en una matriz.</b></p>
 * 
 * @see MatrizTransformer
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
