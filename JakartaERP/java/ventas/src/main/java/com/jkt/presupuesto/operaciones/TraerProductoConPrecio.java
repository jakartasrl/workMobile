package com.jkt.presupuesto.operaciones;

import java.util.Map;

import org.hibernate.Query;

import com.jkt.dominio.Configuracion;
import com.jkt.dominio.ListaPrecioDetalle;
import com.jkt.erp.articulos.Producto;
import com.jkt.excepcion.JakartaException;
import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.Moneda;

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
	private static final String NOMBRE_PARAMETRO_MONEDA_POR_DEFECTO = "MonedaPorDefecto";
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams);

		long idListaPrecio = 0;
		long idProducto;
		
		ListaPrecioDetalle precio = null;
		String idListaPrecioStr = (String) aParams.get(OID_LISTA_PRECIO);
		
		try{
			if (idListaPrecioStr!=null && (!idListaPrecioStr.trim().isEmpty())){
				idListaPrecio=Long.valueOf((String)idListaPrecioStr);
			}
			idProducto=Long.valueOf((String)aParams.get(OID_ART));
		}catch(NumberFormatException e){
			throw new JakartaException("Los parametros que identifican a la lista de precio y a un articulo deben ser numéricos.");
		}
		
		if (idListaPrecio != 0) {			
			String consulta="select detalleLista from ListaPrecioDetalle detalleLista where detalleLista.listaPrecios.id= :idLista and detalleLista.producto.id = :idProducto";
			Query query = crearHQL(consulta);
			query.setParameter("idLista", idListaPrecio);
			query.setParameter("idProducto", idProducto);
			precio = (ListaPrecioDetalle) query.uniqueResult();
			precio.setMoneda(precio.getListaPrecios().getMoneda());
		} 
		
		if (precio==null) { //Si no existe en la lista de precios, muestro el producto con precio 0.
			Configuracion configuracionMonedaPorDefecto = obtenerConfiguracion(NOMBRE_PARAMETRO_MONEDA_POR_DEFECTO);
			Moneda monedaporDefecto = (Moneda) obtener(Moneda.class, Long.valueOf(configuracionMonedaPorDefecto.getValorNumero()));
			
			Producto producto = (Producto) obtener(Producto.class, idProducto);
			precio = new ListaPrecioDetalle();
			precio.setPrecio(0);
			precio.setProducto(producto);
			precio.setMoneda(monedaporDefecto);
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
//		validarEntrada(aParams.get(OID_LISTA_PRECIO));
	}

}
