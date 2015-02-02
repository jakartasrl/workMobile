package com.jkt.presupuesto.operaciones;

import java.util.Map;

import org.hibernate.Query;

import com.jkt.dominio.ListaPrecioDetalle;
import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.articulos.Producto;
import com.jkt.excepcion.JakartaException;
import com.jkt.operaciones.Operation;

/**
 * Usando el id de un producto y el id de una lista de precios, se muestra un producto con su precio correspondiente a dada lista si existe.
 * Si no existe, se retornar un producto con precio 0.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
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
		
		String consulta="select detalleLista from ListaPrecioDetalle detalleLista where detalleLista.listaPrecios.id= :idLista and detalleLista.producto.id = :idProducto";
		Query query = crearHQL(consulta);
		query.setParameter("idLista", idListaPrecio);
		query.setParameter("idProducto", idProducto);
		ListaPrecioDetalle precio = (ListaPrecioDetalle) query.uniqueResult();

		if (precio==null) { //Si no existe en la lista de precios, muestro el producto con precio 0.
			Producto producto = (Producto) obtener(Producto.class, idProducto);
			precio = new ListaPrecioDetalle();
			precio.setPrecio(0);
			precio.setProducto(producto);
		}

		//A la notificacion llega un detalle de lista de precio, este o no en la tabla de ListaPrecioDetalle.
		notificarObjeto(WRITER_PRODUCTO, precio);
		
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
