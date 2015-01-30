package com.jkt.presupuesto.operaciones;

import java.util.Map;

import org.hibernate.Query;

import com.jkt.erp.articulos.Producto;
import com.jkt.excepcion.JakartaException;
import com.jkt.operaciones.Operation;

public class TraerProductoConPrecio extends Operation {

	private static final String WRITER_PRODUCTO = "precio";
	private static final String OID_LISTA_PRECIO = "oid_lista_precio".toUpperCase();
	private static final String OID_ART = "oid_art".toUpperCase();

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams);

		long idListaPrecio;
		long idProducto;
	
		try{
			idListaPrecio=Long.valueOf((String)aParams.get(OID_LISTA_PRECIO));
			idProducto=Long.valueOf((String)aParams.get(OID_ART));
		}catch(NumberFormatException e){
			throw new JakartaException("Los parametros que identifican a la lista de precio y a un articulo deben ser numéricos.");
		}
		
		String consulta="select p from ListaPrecioDetalle detalleLista where detalleLista.listaPrecios.id= :idLista and detalleLista.producto.id = :idProducto";
		Query query = crearHQL(consulta);
		query.setParameter("idLista", idListaPrecio);
		query.setParameter("idProducto", idProducto);
		Producto producto = (Producto) query.uniqueResult();
		if (producto==null) {
			//Retornar el producto en formato de detalle de lista de precio vacio
			notificarObjeto(WRITER_PRODUCTO, producto);
		}else{
			//Notificar el producto ya que no se encuentra en la lista de precio pasada por parametro.
			notificarObjeto(WRITER_PRODUCTO, obtener(Producto.class, idProducto));
		}
		
	}

	/**
	 * Valida que lleguen parametros de la lista de precios y de un producto.
	 * 
	 */
	private void validarEntrada(Map<String, Object> aParams) throws JakartaException {
		validarEntrada(aParams.get(OID_ART));
		validarEntrada(aParams.get(OID_LISTA_PRECIO));
	}

}
