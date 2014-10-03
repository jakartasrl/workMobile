package com.jkt.erp.articulos.operaciones;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.articulos.ArticuloStock;
import com.jkt.erp.articulos.ArticuloStockDet;
import com.jkt.erp.articulos.CaracteristicaProducto;
import com.jkt.erp.articulos.Producto;
import com.jkt.erp.articulos.ProductoClasificador;
import com.jkt.erp.articulos.ProductoDet;
import com.jkt.erp.articulos.ProductoEquivUniMed;
import com.jkt.erp.articulos.TipoProducto;
import com.jkt.operaciones.Operation;
import com.jkt.transformers.Notificacion;
import com.jkt.varios.dominio.Clasificador;

/**
 * <p>Recupera un producto utlizando un identificador numerico, y muestra al mismo y todas sus relaciones.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerProducto extends Operation {

	private static final String IDENTIFICADOR = "oid".toUpperCase();

	private static final String WRITER_PRODUCTO = "producto";
	private static final String WRITER_TIPO_PRODUCTO = "tipoProducto";
	private static final String WRITER_CARACTERISTICAS_DE_PRODUCTO = "detalleTipoProducto";
	private static final String WRITER_ARTICULO_STOCK = "articulosStock";
	private static final String WRITER_ARTICULO_STOCK_DET = "detalleArticuloStock";
	private static final String WRITER_EQUIVALECIAS = "equivalencias";
	private static final String WRITER_CLASIFICADORES = "clasificadores";
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams.get(IDENTIFICADOR));
		
		Producto producto = (Producto) obtener(Producto.class, (String) aParams.get(IDENTIFICADOR));
		
		mostrarProducto(producto);
//		mostrarTipoProducto(producto.getTipoProducto());
		
		mostrarCaracteristicas(producto);
		
		mostrarArticulosStock(producto);
		mostrarEquivalencias(producto.getEquivalencias());
		mostrarClasificadores(producto);
	}

	/**
	 * Muestra los clasificadores seteados para el producto, y los disponibles que tiene para seleccionar.
	 * 
	 * @param producto
	 */
	private void mostrarClasificadores(Producto producto){//List<ProductoClasificador> clasificadoresDeProducto) {
		Map<String, Clasificador> clasificadoresSeteados=new HashMap<String, Clasificador>();
		
		String identificador;
		Clasificador clasificadorDelComponente;
		
		for (ProductoClasificador clasificador : producto.getClasificadores()) {

			identificador=String.valueOf(clasificador.getClasificador().getId());
			clasificadorDelComponente=clasificador.getClasificador();
			//Guardo en un mapa al clasificador que ya ha sido seleccionado
			if (!clasificadoresSeteados.containsKey(identificador)) {
				clasificadoresSeteados.put(identificador,clasificadorDelComponente);
			}
			
			notificarObjecto(Notificacion.getNew(WRITER_CLASIFICADORES, clasificador));
		}
		
		List<PersistentEntity> clasificadores = serviceRepository.getByProperty(Clasificador.class, "entidad", "5");
		Clasificador c;
		ProductoClasificador productoClasificador;
		for (PersistentEntity persistentEntity : clasificadores) {
			c=(Clasificador) persistentEntity;
			if (!clasificadoresSeteados.containsKey(String.valueOf(c.getId()))) {
				productoClasificador = new ProductoClasificador();
				productoClasificador.setId(0L);
				productoClasificador.setClasificador(c);
				productoClasificador.setProducto(producto);
				notificarObjecto(Notificacion.getNew(WRITER_CLASIFICADORES, productoClasificador));
			}
		}
	}

	/**
	 * <p>Muestra las caracteristicas y los valores seleccionados.</p>
	 * <p>Muestra las caracteristicas nuevas o que el usuario no selecciono para el producto.</p>
	 * 
	 * @param producto objetivo
	 * @throws Exception Si ocurre algun error al recuperar todas las entidades caracteristicas desde la base.
	 */
	private void mostrarCaracteristicas(Producto producto) throws Exception {
		List<ProductoDet> detalles = producto.getDetalles();
		
		List<String> idsExistentes=new ArrayList<String>();
		for (ProductoDet productoDet : detalles) {
			notificarObjecto(Notificacion.getNew(WRITER_CARACTERISTICAS_DE_PRODUCTO, productoDet));
			idsExistentes.add(String.valueOf(productoDet.getCaracProducto().getId()));//Agrego las caracteristicas que posee a un arrayList para posteriormente hacer un disjunction con el resto
		}
		
		List<PersistentEntity> caracteristicas = obtenerTodos(CaracteristicaProducto.class);
		CaracteristicaProducto caracteristica;
		ProductoDet detalle;
		for (PersistentEntity persistentEntity : caracteristicas) {
			
			if (persistentEntity.isActivo()) {
				caracteristica=(CaracteristicaProducto) persistentEntity;
				if (!idsExistentes.contains(String.valueOf(caracteristica.getId()))) {
					detalle = new ProductoDet();
					detalle.setCaracProducto(caracteristica);
					notificarObjecto(Notificacion.getNew(WRITER_CARACTERISTICAS_DE_PRODUCTO, detalle));
				}
			}
		}
	}

	/**
	 * <p>Muestra todas las equivalencias que tiene un producto, indicando la unidad de medida de origen, la de destino, y el factor.</p>
	 * @param producto {@link Producto} dueño de las equivalencias
	 */
	private void mostrarEquivalencias(List<ProductoEquivUniMed> equivalencias) {
		for (ProductoEquivUniMed productoEquivUniMed : equivalencias) {
			notificarObjecto(Notificacion.getNew(WRITER_EQUIVALECIAS, productoEquivUniMed));
		}
	}

	/**
	 * <p>Muestra el producto en la salida de la operacion.</p>
	 * <p>Muestra los datos basicos relacionados al producto.</p>
	 * 
	 * @param producto {@link Producto} a mostrar
	 * 
	 */
	private void mostrarProducto(Producto producto) {
		notificarObjecto(Notificacion.getNew(WRITER_PRODUCTO, producto));
	}

	/**
	 * TODO FIXME
	 * Es mas complejo que esto solo, se debe tener el mismo compartamiento que en las caracteristicas del producto.
	 * Mostrar las caracteristicas del detalle de articulo seteado, pero ademas la lista de caracteristicas que todavia no se seleccionaron.
	 * 
	 * @param producto
	 */
	private void mostrarArticulosStock(Producto producto) {
		List<ArticuloStock> articulosStock = producto.getArticulosStock();
		for (ArticuloStock articuloStock : articulosStock) {
			notificarObjecto(Notificacion.getNew(WRITER_ARTICULO_STOCK, articuloStock));
			
			for (ArticuloStockDet articuloStockDet : articuloStock.getDetalles()) {
				notificarObjecto(Notificacion.getNew(WRITER_ARTICULO_STOCK_DET, articuloStockDet));
			}
			
		}
	}

	private void mostrarTipoProducto(TipoProducto tipoProducto) {
		notificarObjecto(Notificacion.getNew(WRITER_TIPO_PRODUCTO, tipoProducto));
	}


}
