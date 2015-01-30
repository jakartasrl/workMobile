package com.jkt.erp.articulos.operaciones;

import java.util.Map;

import org.hibernate.Query;

import com.jkt.operaciones.Operation;

/**
 * Consulta sobre todos los productos que cumplen determinada condición dada por codigo desde y hasta, o un clasificador.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class FiltrarProductos extends Operation {

	private static final String WRITER_PRODUCTO = "producto";
	private static final String CODIGO_HASTA = "cod_art_has".toUpperCase();
	private static final String CODIGO_DESDE = "cod_art_des".toUpperCase();
	
	private static final String CLASIFICADOR = "clasificador".toUpperCase();
	
	
	/**
	 * Los filtros de codigo desde y codigo hasta tienen prioridad sobre el clasificador, es decir que si se reciben los 3 campos, solamente se utilizarán codigo desde y hasta.
	 * 
	 */
	
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		String filtroCodigoDesde=(String) aParams.get(CODIGO_DESDE);
		String filtroCodigoHasta=(String) aParams.get(CODIGO_HASTA);
		String filtroClasificador=(String) aParams.get(CLASIFICADOR);
		
		String basicQuery="from Producto p";
		String orderQuery=QUERY_UTILS_SPACE.concat("order by p.codigo asc");
		Query query;
		
		if (filtrosCodigoValidos(filtroCodigoDesde, filtroCodigoHasta)) {
			//Si son validos filtro por estos elementos
			String filterQuery=QUERY_UTILS_SPACE.concat("where p.codigo >= :codigoDesde and p.codigo <= :codigoHasta");
			query=crearHQL(basicQuery.concat(filterQuery).concat(orderQuery));
			query.setParameter("codigoDesde", filtroCodigoDesde);
			query.setParameter("codigoHasta", filtroCodigoHasta);
		}else if(filtroClasificador!=null && !filtroClasificador.isEmpty()){
			//filtro por clasificador.
			String queryClasificacion="select p from Producto p, ProductoClasificador pc where p.id=pc.producto.id and pc.componenteValor.id= :idClasificador";
			query = crearHQL(queryClasificacion);
			query.setParameter("idClasificador", Long.valueOf(filtroClasificador));
		}else{
			//recupero todos los productos
			query=crearHQL(basicQuery.concat(orderQuery));
		}
		
		notificarObjetos(WRITER_PRODUCTO, query.list());
		
	}
	
	/**
	 * Valida que los filtros no sea vacios.
	 * @param filtroCodigoHasta 
	 * @param filtroCodigoDesde 
	 */
	private boolean filtrosCodigoValidos(String filtroCodigoDesde, String filtroCodigoHasta){
		if(filtroCodigoDesde!=null && filtroCodigoHasta!=null){
			if (filtroCodigoDesde.isEmpty() || filtroCodigoHasta.isEmpty()) {
				return false;
			}
		}else{
			return false;
		}
		return true;
	}

}
