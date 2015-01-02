package com.jkt.transformers;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;

import com.jkt.dominio.Container;
import com.jkt.dominio.PersistentEntity;
import com.jkt.dominio.entidades.xml.Campo;
import com.jkt.excepcion.ExceptionDS;
import com.jkt.excepcion.JakartaException;
import com.jkt.framework.writers.AbsWriter;
import com.jkt.framework.writers.XMLStreamMaker;
import com.jkt.framework.writers.XMLTableMaker;
import com.jkt.request.EventBusiness;
import com.jkt.xmlreader.CampoSalida;
import com.jkt.xmlreader.Output;

/**
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class MatrizTransformer extends Transformer {

	private static final String LONGITUD = "10";
	private static final String COLUMN_WIDTH = "50";
	private static final String TRUE_BOOLEAN_STRING = "true";
	private static final String FALSE_BOOLEAN_STRING = "false";
	private static final String TIPO_DATO_STRING = "String";
	private static final String TIPO_DATO_DOUBLE = "Double";
	private static final String TIPO_DATO_INTEGER = "Integer";
	
	private List<Date> fechas=new ArrayList<Date>();
	private List<PersistentEntity> monedas = new ArrayList<PersistentEntity>();
	private List<PersistentEntity> tiposDeCambio = new ArrayList<PersistentEntity>();
	private List<DatoMatriz> contenedores = new ArrayList<DatoMatriz>();
	
	private String outputName;
	private String currentTableName  = "";
	
	/*
	 * Por defecto se setea el writer simple.
	 */
	private AbsWriter writer = new XMLStreamMaker();
	
	public AbsWriter getWriter() {
		return writer;
	}

	public void setWriter(AbsWriter writer) {
		this.writer = writer;
	}

	@Override
	protected void update(Notificacion arg1) {
		
		if (arg1.getWriterKey().equals("columnas")) {
			for (Object object : (List)arg1.getParameter()) {
				fechas.add((Date)object);
			}
			return;
		}
		
		if (arg1.getWriterKey().equals("monedas")) {
			monedas=(List<PersistentEntity>) arg1.getParameter();
			return;
		}
		
		if (arg1.getWriterKey().equals("tiposDeCambio")) {
			tiposDeCambio=(List<PersistentEntity>) arg1.getParameter();
			return;
		}
		
	}

	/**
	 * Escribe en cada uno de los writers el contenido acumulado sobre el servlet
	 * @throws JakartaException 
	 */
	public synchronized void write() throws JakartaException{
		
		try {
			crearEstructuraMatriz();
			
		} catch (NoSuchMethodException e2) {
			e2.printStackTrace();
		} catch (SecurityException e2) {
			e2.printStackTrace();
		} catch (IllegalAccessException e2) {
			e2.printStackTrace();
		} catch (IllegalArgumentException e2) {
			e2.printStackTrace();
		} catch (InvocationTargetException e2) {
			e2.printStackTrace();
		}
		
		mostrarMetadataColumnas();
		
		mostrarContenido();

		imprimirResultados();
		
	}

	private void imprimirResultados() throws JakartaException {
		XMLStreamMaker makerOrquestador = new XMLStreamMaker();
		makerOrquestador.setStream(this.servletOutputStream);
		
		try {
			makerOrquestador.writeStartTag();
			Collection<XMLTableMaker> values = this.writers.values();
			for (XMLTableMaker xmlTableMaker : values) {
				xmlTableMaker.write();
			}
			makerOrquestador.writeEndTag();
		} catch (IOException e) {
			throw new JakartaException("Ocurrio un problema al escribir los datos de salida.");
		}
	}

	private void mostrarContenido() {
		Notificacion objetoNotificacion=null;
		for (DatoMatriz datoMatriz: contenedores) {
			objetoNotificacion=Notificacion.getNew("tiposDeCambio", datoMatriz);
			if (objetoNotificacion != null) {
				mostrarInformacion(objetoNotificacion);
			}
		}
	}

	private void mostrarMetadataColumnas() {
		Notificacion objectoNotificacion = null;

		int i=0;
		//Primero muestro el encabezado, que es la referencia que actua como titulo de las monedas.
		mostrarInformacion(Notificacion.getNew("columnas", generarCampoOid(i++)));
		mostrarInformacion(Notificacion.getNew("columnas", generarCampoReferencia(i++)));
		
		//Luego las demas columnas.
		for (Date fecha: fechas) {
			objectoNotificacion=Notificacion.getNew("columnas", generarCampo(i++, fecha.toString(), TIPO_DATO_DOUBLE));
			if (objectoNotificacion != null) {
				mostrarInformacion(objectoNotificacion);
			}
		}
		
		mostrarInformacion(Notificacion.getNew("columnas", generarCampoNuevo(i)));
	}

	private Object generarCampoNuevo(int i) {
		Campo campo = new Campo();
		campo.setFieldName("valor");
		campo.setLabel("Hoy");
		campo.setColumnWidth(COLUMN_WIDTH);
		campo.setLongitud(LONGITUD);
		campo.setTag("1");
		campo.setVisible(TRUE_BOOLEAN_STRING);
		campo.setReadOnly(FALSE_BOOLEAN_STRING);
		campo.setOrden(String.valueOf(i));
		campo.setTipo(TIPO_DATO_DOUBLE);
		return campo;
	}

	private Campo generarCampoReferencia(int i) {
		Campo campo = new Campo();
		campo.setFieldName("referencia");
		campo.setLabel("Moneda");
		campo.setColumnWidth(COLUMN_WIDTH);
		campo.setLongitud(LONGITUD);
		campo.setTag("0");
		campo.setVisible(TRUE_BOOLEAN_STRING);
		campo.setReadOnly(TRUE_BOOLEAN_STRING);
		campo.setOrden(String.valueOf(i));
		campo.setTipo(TIPO_DATO_STRING);
		return campo;
	}

	private Campo generarCampoOid(int i) {
		Campo campo = new Campo();
		campo.setFieldName("oid_moneda");
		campo.setLabel("oid_moneda");
		campo.setColumnWidth(COLUMN_WIDTH);
		campo.setLongitud(LONGITUD);
		campo.setTag("1");
		campo.setVisible(FALSE_BOOLEAN_STRING);
		campo.setReadOnly(TRUE_BOOLEAN_STRING);
		campo.setOrden(String.valueOf(i));
		campo.setTipo(TIPO_DATO_INTEGER);
		return campo;
	}

	/**
	 * Genera un campo para cada fecha estableciendo orden, valores, nombres de columnas y metadata necesaria para hacer 
	 * el renderizado de la grilla o mas parecido a los CRUD genericos.
	 * 
	 */
	private Campo generarCampo(int i, String label, String tipoDeDato) {
		Campo campo = new Campo();
		
		//Fieldname es el nombre clave de la variable.
		campo.setFieldName("dato"+(i-1));

		campo.setLabel(label);
		campo.setColumnWidth(COLUMN_WIDTH);
		campo.setLongitud(LONGITUD);
		campo.setTag("0");
		campo.setVisible(TRUE_BOOLEAN_STRING);
		campo.setReadOnly(TRUE_BOOLEAN_STRING);
		campo.setOrden(String.valueOf(i));
		campo.setTipo(tipoDeDato);
		return campo;
	}

	private void mostrarInformacion(Notificacion currentEntry) {
		Object instance = (Object) currentEntry.getParameter();
		
		XMLTableMaker writer = this.writers.get(currentEntry.getWriterKey());
		if (writer==null) {
			throw new RuntimeException("No existe el writer indicado.");//TODO Es necesario levantar la excepcion en este caso?
		}
		
		Object parameter = currentEntry.getParameter();
		EventBusiness eventBusiness = (EventBusiness) this.getEvent();
		
		Output currentTable;
		try {
			currentTable = eventBusiness.getHijoOutput(writer.getIdentificadorTabla()); //Busca el OUTPUT especificado.
		} catch (JakartaException e) {
			throw new RuntimeException("Error al recuperar el esqueleto de la tabla solicitada.");
		}
		writer.addFila();
		for (CampoSalida currentFila : currentTable.getCamposDeSalida()) { 
			Object resultado;
			try {
				resultado = solver.resolveMethodInvocation(currentFila.getTarget(), parameter);
			} catch (ExceptionDS e) {
				resultado=null;
			} catch (NoSuchMethodException e) {
				resultado=null;
			} 
			catch (SecurityException e) {
				resultado=null;
			}
			if (resultado!=null) {
				writer.addColumna(currentFila.getValue(), resultado);
			}else{
				//log this
			}
		}
	}

	private void crearEstructuraMatriz() throws NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, JakartaException {
		Map<String, Map<String, PersistentEntity>> mapa=new HashMap<String, Map<String,PersistentEntity>>();
		
		/*
		 * Cargo el mapa con las monedas como key y los values mapas vacios.(Estos mapas vacios son, key fecha, value tipoDeCambio)
		 */
		for (PersistentEntity persistentEntity : monedas) {
			mapa.put(String.valueOf(persistentEntity.getId()), new HashMap<String, PersistentEntity>());
		}
		
		
		/*
		 * Tengo un mapa con key ids monedas, y value mapa con key fecha y value tipo de cambio.
		 * es momento de recorrer toooodoooosss los tipos de cambio, y meterlos en el key correspondientes, con la fecha correspondiente.
		 */
		
		String monedaId , fechaCadena;
		Map<String, PersistentEntity> mapaTiposDeCambio;
		for (PersistentEntity persistentEntity : tiposDeCambio) {
			
			PersistentEntity moneda=(PersistentEntity) ejecutarMetodo("getMoneda", persistentEntity);
			Date fecha=(Date) ejecutarMetodo("getFecha", persistentEntity);
			
			monedaId= String.valueOf(moneda.getId());
			fechaCadena= fecha.toString();
			
			mapaTiposDeCambio = mapa.get(monedaId);
			mapaTiposDeCambio.put(fechaCadena, persistentEntity);
		}
		
		
		/*
		 * Por cada moneda, busco en el mapa las 5 fechas de la lista, y recupero los tipos de cambio.
		 * 
		 * 1- recorro las monedas.
		 * 2- hago un for de las fechas, x cada fecha, recupero del mapa el tipo de cambio.
		 * 
		 */
		
		for (PersistentEntity monedaActual : monedas) {
			DatoMatriz datoMatriz = new DatoMatriz();
			datoMatriz.setReferencia((String)ejecutarMetodo("getDescripcion", monedaActual));
			
			int i=1;
			for (Date fechaActual : fechas) { //no necesariamente es la fecha de hoy, sino la fecha actual del bucle
				Map<String, PersistentEntity> mapaFechaTipoCambio = mapa.get(String.valueOf(monedaActual.getId()));
				PersistentEntity tipoDeCambioRecuperado = mapaFechaTipoCambio.get(fechaActual.toString());
				if (tipoDeCambioRecuperado!=null) {
//					asignarResultado(datoMatriz, String.valueOf(tipoDeCambioRecuperado.getCotizacion()), i);
					asignarResultado(datoMatriz, String.valueOf(ejecutarMetodo("getCotizacion", tipoDeCambioRecuperado)), i);
					
					datoMatriz.setIdElemento(String.valueOf(monedaActual.getId()));
					datoMatriz.setValor("1");
				}
				i++;
			}
			
			validarDatoMatriz(datoMatriz);
//			notificarObjeto(WRITER_TIPO_DE_CAMBIO, datoMatriz);
			contenedores.add(datoMatriz);
			
		}
	}

	@Override
	public void setup(ServletOutputStream outputStream, String ouputName) throws JakartaException {
		configurarVariosWriters(outputStream);
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
	 * 
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
	
	/**
	 * Ejecuta un metodo simple sin parametros sobre una instancia.
	 * 
	 * @param metodo es el nombre del metodo a ejecutar.
	 * @param instancia es el objeto sobre el cual se ejecuta el metodo.
	 */
	private Object ejecutarMetodo(String metodo, Object instancia) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException{
		Method method = instancia.getClass().getMethod(metodo);
		Object resultado = method.invoke(instancia);
		return resultado;
	}

}
