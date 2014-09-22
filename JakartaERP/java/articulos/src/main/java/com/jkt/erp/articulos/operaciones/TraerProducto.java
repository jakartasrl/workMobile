package com.jkt.erp.articulos.operaciones;

import java.util.List;
import java.util.Map;

import com.jkt.erp.articulos.ArticuloStock;
import com.jkt.erp.articulos.ArticuloStockDet;
import com.jkt.erp.articulos.Producto;
import com.jkt.erp.articulos.TipoProducto;
import com.jkt.erp.articulos.TipoProductoDet;
import com.jkt.operaciones.Operation;
import com.jkt.transformers.Notificacion;

/**
 * <p>Recupera un producto utlizando un identificador numerico, y muestra al mismo y todas sus relaciones.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerProducto extends Operation {

	private static final String IDENTIFICADOR = "oid".toUpperCase();

	private static final String WRITER_PRODUCTO = "producto";
	private static final String WRITER_TIPO_PRODUCTO = "tipoProducto";
	private static final String WRITER_DETALLE_TIPO_PRODUCTO = "detalleTipoProducto";
	private static final String WRITER_ARTICULO_STOCK = "articulosStock";
	private static final String WRITER_ARTICULO_STOCK_DET = "detalleArticuloStock";
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		Producto producto = (Producto) obtener(Producto.class, (String) aParams.get(IDENTIFICADOR));
		
		mostrarProducto(producto);
		mostrarTipoProducto(producto.getTipoProducto());
		mostrarArticulosStock(producto);
		
	}

	/**
	 * Muestra el producto en la salida de la operacion.
	 * 
	 * @param producto {@link Producto} a mostrar
	 * 
	 */
	private void mostrarProducto(Producto producto) {
		notificarObjecto(Notificacion.getNew(WRITER_PRODUCTO, producto));
	}

	private void mostrarArticulosStock(Producto producto) {
		List<ArticuloStock> articulosStock = producto.getArticulosStock();
		List<ArticuloStockDet> detalles;
		for (ArticuloStock articuloStock : articulosStock) {
			notificarObjecto(Notificacion.getNew(WRITER_ARTICULO_STOCK, articuloStock));
			
			detalles = articuloStock.getDetalles();
			for (ArticuloStockDet articuloStockDet : detalles) {
				notificarObjecto(Notificacion.getNew(WRITER_ARTICULO_STOCK_DET, articuloStockDet));
			}
			
		}
	}

	private void mostrarTipoProducto(TipoProducto tipoProducto) {
		notificarObjecto(Notificacion.getNew(WRITER_TIPO_PRODUCTO, tipoProducto));

		for (TipoProductoDet detalleTipoProducto : tipoProducto.getCaracteristicas()) {
			/*
			 * Esta linea muestra el detalle del tipo de producto, la caracteristica y el valor de la caracteristica.
			 * Se recorren las relaciones correspondientes mapeadas en el archivo operaciones-*.xml
			 */
			notificarObjecto(Notificacion.getNew(WRITER_DETALLE_TIPO_PRODUCTO, detalleTipoProducto)); 
		}
		
	}


}
