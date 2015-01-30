package com.jkt.cotizador.operaciones;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.Configuracion;
import com.jkt.dominio.ListaPrecioDetalle;
import com.jkt.dominio.ListaPrecios;
import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.articulos.Producto;
import com.jkt.excepcion.JakartaException;
import com.jkt.laboratorio.dominio.Determinacion;
import com.jkt.laboratorio.dominio.Laboratorio;
import com.jkt.operaciones.Operation;

/**
 * <p>Operacion que recupera la lista de precios que se corresponde con un OID pasado por parametros.</p>
 * <p>Dada esta lista de precios, se muestran en 3 salidas diferentes los precios de productos, determinaciones quimicas y electricas.</p>
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@SuppressWarnings("rawtypes")
public class RecuperarDetallesDeListaDePrecio extends Operation {

	
	private static final String MENSAJE_ERROR = "Existe una inconsistencia en el detalle de lista de precio. Compruebe que el detalle esta relacionado a un laboratorio quimico, laboratorio electrico o a un producto.";
	
	private static final String WRITER_LISTA = "lista";
	private static final String WRITER_PRODUCTOS = "productos";
	private static final String WRITER_DETERMINACIONES_ELECTRICAS = "determinacionesElectricas";
	private static final String WRITER_DETERMINACIONES_QUIMICAS = "determinacionesQuimicas";
	
	private static final String IDENTIFICADOR = "oid".toUpperCase();
	private static final String NOMBRE_PARAMETRO_LABORATORIO_QUIMICO = "LaboratorioQuimico";
	private static final String NOMBRE_PARAMETRO_LABORATORIO_ELECTRICO = "LaboratorioElectrico";

	private List idsDeterminacionesQuimicas=new ArrayList();
	private List idsDeterminacionesElectricas=new ArrayList();
	private List idsProductos=new ArrayList();
	
	private Laboratorio laboratorioQuimico;
	private Laboratorio laboratorioElectrico;
	
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		validarEntrada(aParams.get(IDENTIFICADOR));
		
		//Recupero los identificadores de las instancias de los labo quimico y electrico
		Configuracion configuracionLaboratorioElectrico = obtenerConfiguracion(NOMBRE_PARAMETRO_LABORATORIO_ELECTRICO);
		Configuracion configuracionLaboratorioQuimico = obtenerConfiguracion(NOMBRE_PARAMETRO_LABORATORIO_QUIMICO);
		
		//Compruebo la consistencia de los datos parametrizados recuperando los laboratorios correspondientes
		laboratorioElectrico=(Laboratorio) obtener(Laboratorio.class, Long.valueOf(configuracionLaboratorioElectrico.getValorNumero()));
		laboratorioQuimico=(Laboratorio) obtener(Laboratorio.class, Long.valueOf(configuracionLaboratorioQuimico.getValorNumero()));
		
		//Recupero la lista de precio a mostrar detalles
		ListaPrecios lista = (ListaPrecios) obtener(ListaPrecios.class,(String) aParams.get(IDENTIFICADOR));
		notificarObjeto(WRITER_LISTA, lista);

		/*
		 * Dependiendo del tipo de contenido del detalle se muestra en dada salida
		 */
		List<ListaPrecioDetalle> detalles = lista.getDetalles();
		String writer;
		for (ListaPrecioDetalle detalle : detalles) {
			if (detalle.getProducto()!=null) {
				writer=WRITER_PRODUCTOS;
				idsProductos.add(detalle.getProducto().getId());
				
			}else if (detalle.getDeterminacion().getLaboratorio().getId()==laboratorioElectrico.getId()) {
				
				writer=WRITER_DETERMINACIONES_ELECTRICAS;
				idsDeterminacionesElectricas.add(detalle.getDeterminacion().getId());
				
			}else if (detalle.getDeterminacion().getLaboratorio().getId()==laboratorioQuimico.getId()) {
				
				writer=WRITER_DETERMINACIONES_QUIMICAS;
				idsDeterminacionesQuimicas.add(detalle.getDeterminacion().getId());
				
			}else{
				throw new JakartaException(MENSAJE_ERROR);
			}
			notificarObjeto(writer, detalle);
		}
		
		/*
		 * Luego se muestran los nuevos productos los cuales aun no se les asigno un precio
		 */
		mostrarProductosSinPrecio();
		
		mostrarDeterminacionesElectricasSinPrecio();
		
		mostrarDeterminacionesQuimicasSinPrecio();
		
		
	}

	private void mostrarDeterminacionesQuimicasSinPrecio() {
		String writer=WRITER_DETERMINACIONES_QUIMICAS;
		List<Determinacion> determinacionesQuimicas = laboratorioQuimico.getDeterminaciones();
		for (Determinacion determinacion : determinacionesQuimicas) {
			if (!idsDeterminacionesQuimicas.contains(determinacion.getId())) {
				ListaPrecioDetalle detalle = new ListaPrecioDetalle();
				detalle.setDeterminacion(determinacion);
				notificarObjeto(writer, detalle);
			}
		}
	}

	private void mostrarDeterminacionesElectricasSinPrecio() {
		String writer=WRITER_DETERMINACIONES_ELECTRICAS;
		List<Determinacion> determinacionesElectricas = laboratorioElectrico.getDeterminaciones();
		for (Determinacion determinacion : determinacionesElectricas) {
			if (!idsDeterminacionesElectricas.contains(determinacion.getId())) {
				ListaPrecioDetalle detalle = new ListaPrecioDetalle();
				detalle.setDeterminacion(determinacion);
				notificarObjeto(writer, detalle);
			}
		}
	}

	private void mostrarProductosSinPrecio() throws Exception {
		String writer=WRITER_PRODUCTOS;
		List<PersistentEntity> productos = obtenerTodos(Producto.class);
		for (PersistentEntity producto : productos) {
			if (!idsProductos.contains(producto.getId())) {
				ListaPrecioDetalle detalle = new ListaPrecioDetalle();
				detalle.setProducto((Producto)producto);
				notificarObjeto(writer, detalle);
			}
		}
	}

}
