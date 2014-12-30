package com.jkt.varios.operaciones;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.jkt.dominio.Container;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;
import com.jkt.operaciones.Operation;
import com.jkt.transformers.DatoMatriz;
import com.jkt.varios.dominio.Moneda;
import com.jkt.varios.dominio.TipoContacto;
import com.jkt.varios.dominio.TipoDeCambio;

/**
 * Trae un template de tipo de cambio con todas las monedas para que puedan cargarse sus equivalencias.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class CopyOfTraerTiposDeCambioEnMatriz2 extends Operation {


	private static final String WRITER_COLUMNAS = "columnas";
	private static final String WRITER_TIPO_DE_CAMBIO = "tiposDeCambio";

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
		 * Notificar esta lista ya!!
		 * TODO ver esto
		 */
		List<Date> fechas=new ArrayList<Date>();
		
		for (Object object : query.list()) {
			fechas.add((Date)object);
			Container container = new Container();
			Date fecha=(Date)object;
			container.setValue(fecha.toString());
			notificarObjeto(WRITER_COLUMNAS, container);
		}
		
		/*
		 * Ya tenemos las fechas
		 */
		
		List<PersistentEntity> monedas = obtenerTodos(Moneda.class);
		List<PersistentEntity> tiposDeCambio = obtenerTodos(TipoDeCambio.class);

		Map<String, Map<String, TipoDeCambio>> mapa=new HashMap<String, Map<String,TipoDeCambio>>();
		
		/*
		 * Cargo el mapa con las monedas como key y los values mapas vacios.(Estos mapas vacios son, key fecha, value tipoDeCambio)
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
		String monedaId, fecha;
		Map<String, TipoDeCambio> mapaTiposDeCambio;
		for (PersistentEntity persistentEntity : tiposDeCambio) {
			tipoDeCambio=(TipoDeCambio) persistentEntity;
			
			monedaId= String.valueOf(tipoDeCambio.getMoneda().getId());
			fecha= tipoDeCambio.getFecha().toString();
			
			mapaTiposDeCambio = mapa.get(monedaId);
			mapaTiposDeCambio.put(fecha, tipoDeCambio);
		}
		
		
		/*
		 * Por cada moneda, busco en el mapa las 5 fechas de la lista, y recupero los tipos de cambio.
		 * 
		 * 1- recorro las monedas.
		 * 2- hago un for de las fechas, x cada fecha, recupero del mapa el tipo de cambio.
		 * 
		 */
		
		for (PersistentEntity monedaActual : monedas) {
			moneda=(Moneda) monedaActual;
			DatoMatriz datoMatriz = new DatoMatriz();
			datoMatriz.setReferencia(moneda.getDescripcion());
			
			int i=1;
			for (Date fechaActual : fechas) { //no necesariamente es la fecha de hoy, sino la fecha actual del bucle
				Map<String, TipoDeCambio> mapaFechaTipoCambio = mapa.get(String.valueOf(monedaActual.getId()));
				TipoDeCambio tipoDeCambioRecuperado = mapaFechaTipoCambio.get(fechaActual.toString());
				if (tipoDeCambioRecuperado!=null) {
					asignarResultado(datoMatriz, String.valueOf(tipoDeCambioRecuperado.getCotizacion()), i);
//				}else{
//					asignarResultado(datoMatriz, "", i);
				}
				i++;
			}
			
			validarDatoMatriz(datoMatriz);
			notificarObjeto(WRITER_TIPO_DE_CAMBIO, datoMatriz);
		}
		
		
		
//		System.out.println(fechas.size());
	}
	
	/**
	 * Si una de las ultimas fechas no se corresponde con un tipo de cambio, se deja el valor en null, con lo cual este metodo valida cada uno de los datos
	 * y setea un vacio en formato de cadena para que se muestre correctamente en el cliente.
	 * 
	 */
	private void validarDatoMatriz(DatoMatriz datoMatriz) throws NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		
		for (int i = 1; i <= 5; i++) {
			Method getMethod=DatoMatriz.class.getMethod("getDato"+i);
			Method setMethod=DatoMatriz.class.getMethod("setDato"+i, String.class);
			String result = (String) getMethod.invoke(datoMatriz);
			if (result==null) {
				setMethod.invoke(datoMatriz, "");
			}
		}
		
	}

	/**
	 * Asigna donde corresponda el dato recibido.
	 * @throws JakartaException 
	 * @throws SecurityException 
	 * @throws NoSuchMethodException 
	 * @throws InvocationTargetException 
	 * @throws IllegalArgumentException 
	 * @throws IllegalAccessException 
	 */
	private DatoMatriz asignarResultado(DatoMatriz datoMatriz, String valor, int i) throws JakartaException, NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		
		if (i<1 || i>5) {
			throw new JakartaException("El dato que se quiere mostrar en la matriz posee una inconsistencia.");
		}
		
		Method setMethod=DatoMatriz.class.getMethod("setDato"+i, String.class);

		setMethod.invoke(datoMatriz, valor);
		
		return datoMatriz;
	}
	
//	private Campo crearEstructura(String fieldName, String label){
//		
//	}
	
//	private String fieldName, tipo, longitud, visible, readOnly, orden, label, columnWidth, tag;

	
}
