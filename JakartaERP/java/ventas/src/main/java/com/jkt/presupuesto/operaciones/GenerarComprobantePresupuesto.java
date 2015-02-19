package com.jkt.presupuesto.operaciones;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.dynamicreports.jasper.builder.JasperReportBuilder;
import net.sf.dynamicreports.report.builder.DynamicReports;
import net.sf.dynamicreports.report.exception.DRException;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JREmptyDataSource;

import org.apache.commons.digester3.Digester;
import org.xml.sax.SAXException;

import com.jkt.dominio.Configuracion;
import com.jkt.excepcion.JakartaException;
import com.jkt.operaciones.Operation;
import com.jkt.presupuesto.dominio.CondicionComercial;
import com.jkt.presupuesto.dominio.DatosEmpresa;
import com.jkt.presupuesto.dominio.ItemResumen;
import com.jkt.presupuesto.dominio.Nota;
import com.jkt.presupuesto.dominio.Presupuesto;
import com.jkt.presupuesto.dominio.PresupuestoDet;
import com.jkt.varios.dominio.Especificacion;

/**
 * Operacion que genera un comprobante en PDF para un presupuesto dado.
 * 
 * TODO extract class pattern... ~~abstractComprobante
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class GenerarComprobantePresupuesto extends Operation {

	private static final String MENSAJE_ERROR_CREACION_COMPROBANTE = "No fue posible crear el comprobante.";
	private static final String MENSAJE_CONDICIONES_VACIAS = "No existen condiciones comerciales para el presupuesto.";
	private static final String MENSAJE_NOTAS_VACIAS = "No existen notas para el presupuesto.";
	private static final String WRITER_ARCHIVO = "comprobante";
	private static final String KEY_RUTA_COMPARTIDA = "rutaCompartida";
	private static final String RUTA_IMAGENES = "imagenes/";
	private static final String RUTA_PRESUPUESTO = "presupuestos/";
	private static final String EXTENSION = ".pdf";
	private static final String OID_PRESUPUESTO = "oid".toUpperCase();

	private String rutaCompartida;
	private Presupuesto p;
	
	private DatosEmpresa datosEmpresa;

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		/*
		 * Valido el parametro obligatorio y recupero el presupuesto para generar el comprobante
		 */
		
		validarEntrada(aParams.get(OID_PRESUPUESTO));
		p = (Presupuesto) obtener(Presupuesto.class, (String)aParams.get(OID_PRESUPUESTO));

		
		/*
		 * Recupero la ruta compartida para guardar el archivo
		 */
		
		Configuracion configuracionRuta = obtenerConfiguracion(KEY_RUTA_COMPARTIDA);
		rutaCompartida = configuracionRuta.getValorCadena();
		
		if (rutaCompartida.endsWith("/")) {

			validarDirectorio(RUTA_PRESUPUESTO);
			validarDirectorio(RUTA_IMAGENES);
			
			obtenerDatosEmpresa();
			
			Especificacion e = generarComprobante(p);
			notificarObjeto(WRITER_ARCHIVO, e);
		}else{
			throw new JakartaException("La ruta compartida debe terminar con el caracter 'barra' // ");
		}
		
		
		
	}
	
	
	/**
	 * Valida que el directorio indicado por parametro exista.
	 * <p>Si el directorio no existe, se levanta una excepcion.</p>
	 * 
	 */
	protected void validarDirectorio(String nombreDirectorio) throws JakartaException{
		String sFichero = rutaCompartida.concat(nombreDirectorio);
		File fichero = new File(sFichero);
		if (!fichero.exists()){
			throw new JakartaException("Directorio necesario: "+sFichero);
		}
		
		if (!fichero.isDirectory()) {
			throw new JakartaException("Directorio necesario: "+sFichero);
		}
	}
	
	
	/**
	 * 
	 * Asigna los datos de la empresa.
	 * 
	 * @throws JakartaException cuando el archivo de datos de empresa es inconsistete, 
	 * no contiene elementos o la cantidad de elementos que retornan información son mas de uno.
	 */
	public void obtenerDatosEmpresa() throws JakartaException {
		try {
			Digester digester = generarReglas();
			InputStream in = Presupuesto.class.getResourceAsStream("datosEmpresa.xml");
			
			List elementos=(List)digester.parse(in);
			if (elementos.size()!=1) {
				throw new JakartaException("Existen inconsistencias en el archivo de datos de la empresa.");
			}
			datosEmpresa=(DatosEmpresa) elementos.get(0);//Hay que obtener el primero.
		} catch (IOException e) {
			throw new RuntimeException("Error de entrada/salida.");
		} catch (SAXException e) {
			throw new RuntimeException("Error de parseo en el archivo de datos de la empresa.");
		}
	}
	
	/**
	 * Genera las reglas 
	 * 
	 */
	private Digester generarReglas() {
		Digester digester = new Digester();
		digester.setValidating(false);
		
		digester.addObjectCreate("elementos", ArrayList.class);
		
		digester.addObjectCreate("elementos/elemento", DatosEmpresa.class.getName());
		digester.addSetProperties("elementos/elemento");
		digester.addSetNext("elementos/elemento", "add", DatosEmpresa.class.getName());

		return digester;
	}


	/**
	 * Genera el comprobante y retorna datos para mostrar a la vista
	 * 
	 */
	private Especificacion generarComprobante(Presupuesto p) throws IOException, JakartaException {
		InputStream is = Presupuesto.class.getResourceAsStream(retrieveTemplate());
		String nombreArchivo="";
		try {
			
			JasperReportBuilder report = DynamicReports.report();
			report.setTemplateDesign(is);
			
			report.setDataSource(createDataSource());
			
			Map<String, Object> parameters=new HashMap<String, Object>();
			
			String referenciaPresupuesto="Sobre un (1) Transformador TTE de 15/15/10 MVA - 132/33/12,2 kV (año 1975)";
			parameters.put("descripcionPresupuesto", "-----------------------------");
			
			parameters.put("lugarFecha", String.format("%s, %s",datosEmpresa.getProvincia(), obtenerFechaActual()));			
			parameters.put("cliente", p.getClienteSucursal().getCliente().getSujetoImpositivo().getRazonSocial());
			
			parameters.put("calle", p.getClienteSucursal().getDireccion().getDireccion());
			
			String direccionCompleta=String.format("%s - %s (%s)", p.getClienteSucursal().getDireccion().getCodigoPostal(), p.getClienteSucursal().getDireccion().getProvincia().getDescripcion(), p.getClienteSucursal().getDireccion().getPais().getDescripcion());
			parameters.put("direccion", direccionCompleta);
			
			parameters.put("pais", p.getClienteSucursal().getDireccion().getPais().getDescripcion());

			parameters.put("presentacion", datosEmpresa.getPresentacion());

			parameters.put("contactoRef", p.getContactoReferencia().getApellidoYNombre());
			
			parameters.put("referencia", p.getReferencia());

			parameters.put("nroPresupuesto", p.getNro());
			
			parameters.put("items", obtenerDetalles());
			parameters.put("notas", obtenerNotas());
			parameters.put("condiciones", obtenerCondiciones());

			/*
			 * Datos de la empresa
			 */
			validarDatosEmpresa();
			parameters.put("nombreEmpresa", datosEmpresa.getNombre());
			parameters.put("direccionEmpresa", datosEmpresa.getDireccion());
			parameters.put("provinciaEmpresa", datosEmpresa.getProvincia());
			parameters.put("telEmpresa", datosEmpresa.getTelefono());
			parameters.put("faxEmpresa", datosEmpresa.getFax());
			parameters.put("webEmpresa", datosEmpresa.getPaginaWeb());
			parameters.put("emailEmpresa", datosEmpresa.getEmail());
			
			parameters.put("usuario", "Daniel Bokhdjalian");
			parameters.put("titulo", "Gerente Comercial");
			parameters.put("saludos", datosEmpresa.getSaludo());

			
			asignarImagenes(parameters);
			asignarImageneFirma(parameters);
			

			report.setParameters(parameters);
			nombreArchivo = generarNombreDeArchivo();

			OutputStream outputStream = new FileOutputStream(rutaCompartida.concat(RUTA_PRESUPUESTO).concat(nombreArchivo).concat(EXTENSION));

			report.toPdf(outputStream);
			outputStream.close();

			Especificacion especificacion = new Especificacion();
			especificacion.setNombre(nombreArchivo.concat(EXTENSION));
			especificacion.setRuta(rutaCompartida.concat(RUTA_PRESUPUESTO));
			return especificacion;
		
		} catch (DRException e) {
			e.printStackTrace();
			throw new JakartaException(MENSAJE_ERROR_CREACION_COMPROBANTE);
		}
	}

	/**
	 * Asigna una firma customizada.
	 */
	private void asignarImageneFirma(Map<String, Object> parameters) {
//		parameters.put("firma", rutaCompartida.concat(RUTA_IMAGENES).concat(datosEmpresa.getFirma()));
	}

	/**
	 * Asigna los parametros para las imagenes.
	 * 
	 */
	private void asignarImagenes(Map<String, Object> parameters) {
		parameters.put("logo", rutaCompartida.concat(RUTA_IMAGENES).concat(datosEmpresa.getLogo()));
		parameters.put("iso", rutaCompartida.concat(RUTA_IMAGENES).concat(datosEmpresa.getIso()));
		parameters.put("firma", rutaCompartida.concat(RUTA_IMAGENES).concat(datosEmpresa.getFirma()));
	}

	private void validarDatosEmpresa() throws JakartaException {
		if (datosEmpresa.getNombre().isEmpty()) {
			throw new JakartaException("Debe ingresar el nombre de la empresa");
		}
		if (datosEmpresa.getTelefono().isEmpty()) {
			throw new JakartaException("Debe ingresar el telefono de la empresa");
		}
		if (datosEmpresa.getFax().isEmpty()) {
			throw new JakartaException("Debe ingresar el fax de la empresa");
		}
		if (datosEmpresa.getPaginaWeb().isEmpty()) {
			throw new JakartaException("Debe ingresar el sitio web de la empresa");
		}
		if (datosEmpresa.getEmail().isEmpty()) {
			throw new JakartaException("Debe ingresar el email de la empresa");
		}
		if (datosEmpresa.getProvincia().isEmpty()) {
			throw new JakartaException("Debe ingresar la provincia de la empresa");
		}
		if (datosEmpresa.getDireccion().isEmpty()) {
			throw new JakartaException("Debe ingresar la dirección de la empresa");
		}
		
	}

	/**
	 * Retorna una lista de cadenas, que representa las condiciones comerciales
	 * 
	 */
	private  List<String> obtenerCondiciones() {
		//Ver el tema del tipo de clase y demas.Si mando Arrays.asList no recuerdo si funcionaba.
		List<String> condiciones=new ArrayList<String>();
		
		for (CondicionComercial condicion: p.getCondicionesComerciales()) {
			condiciones.add(condicion.getDescripcion());
		}
		
		if (condiciones.isEmpty()) {
			condiciones.add(MENSAJE_CONDICIONES_VACIAS);
		}
		
		return condiciones;
	}

	/**
	 * Retorna una lista de cadenas que representan las notas de presupuesto
	 * 
	 */
	private List<String> obtenerNotas() {
		//Ver el tema del tipo de clase y demas.Si mando Arrays.asList no recuerdo si funcionaba.
		List<String> notas=new ArrayList<String>();
		
		for (Nota nota : p.getNotas()) {
			notas.add(nota.getDescripcion());
		}
		
		if (notas.isEmpty()) {
			notas.add(MENSAJE_NOTAS_VACIAS);
		}
		
		return notas;
	}

	/**
	 * Retorna todos los detalles del presupuesto en un formato acorde para mostrar en el presupuesto
	 */
	private List<ItemResumen> obtenerDetalles() throws JakartaException {
		List<ItemResumen> data = new ArrayList<ItemResumen>();
		
		List<PresupuestoDet> detalles = p.getDetalles();

		int nroItem=1;
		String referencia;
		String descripcion;
		String precio;
		int cantidad=0;
		for (PresupuestoDet detalle : detalles) {

			cantidad=detalle.getCantidad();
			precio= "Precio: "+ String.valueOf(detalle.getPrecio()) + " - Moneda: "+detalle.getMoneda().getDescripcion();
			//	String.format("Precio: %1$,.2f  - Moneda: %s", detalle.getPrecio(), detalle.getMoneda().getDescripcion());
			referencia=detalle.getReferencia();
			cantidad=detalle.getCantidad();
			
			switch (detalle.getTipoDetalle()) {
			case PresupuestoDet.CHAR_ELECTRICO:
				descripcion=String.format("Determinación Laboratorio Eléctrico - Cantidad: %d - Determinacion: %s", cantidad ,detalle.getDeterminacion().getDescripcion());
				break;
			case PresupuestoDet.CHAR_QUIMICO:
				descripcion=String.format("Determinación Laboratorio Quimico - Cantidad: %d - Determinacion: %s", cantidad ,detalle.getDeterminacion().getDescripcion());
				break;
			case PresupuestoDet.CHAR_MATERIAL:
				descripcion=String.format("%s de %d Producto: %s", detalle.getDescripcion() , cantidad, detalle.getProducto().getDescripcionAbrev());
				break;
			case PresupuestoDet.CHAR_ITEM:
				descripcion=detalle.getDescripcion();
				break;
			default:
				throw new JakartaException("No se generará el comprobante debido a que los detalles del presupuesto son inconsistentes en cuanto a su tipo.");
			}
			
			data.add(new ItemResumen(String.valueOf(nroItem++), referencia, descripcion, precio));
			
		}
		
		return data;
	}

	/**
	 * Retorna la fecha actual en un formato especificado.
	 */
	private String obtenerFechaActual() {
        Calendar c1 = GregorianCalendar.getInstance();
	    SimpleDateFormat sdf = new SimpleDateFormat("dd-MMMMM-yyyy");
	    String fechaConGuiones = sdf.format(c1.getTime());
	    String[] arregloFecha = fechaConGuiones.split("-");
	    return arregloFecha[0]+" de "+ arregloFecha[1]+" de "+arregloFecha[2];
	}

	/**
	 * Retorna el data source para enviar al reporte
	 */
	private JRDataSource createDataSource() {
		return new JREmptyDataSource(1);
	}


	/**
	 * Recupera el nombre del template de jasper reports para aplicarlo al comprobante.
	 * Depende del tipo de reporte, el tipo de comprobante, etc etc.
	 * TODO definir bien esto...
	 */
	private String retrieveTemplate() {
		return "presupuesto.jrxml";
	}

	/**
	 * Genera un nombre para el comprobante a ser creado.
	 * Toma el nombre de la clase del comprobamte y la fecha actual.
	 * TODO ver que formato quieren...
	 */
	private String generarNombreDeArchivo() {
		Date date = new Date();
		String nombreArchivo = Presupuesto.class.getSimpleName().concat("_").concat(date.toString());
		nombreArchivo = nombreArchivo.replace(" ", "_").replace(":", "_");
		return nombreArchivo;
	}

}
