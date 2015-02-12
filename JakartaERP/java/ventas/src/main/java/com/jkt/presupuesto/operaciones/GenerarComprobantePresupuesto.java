package com.jkt.presupuesto.operaciones;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
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
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import com.jkt.dominio.Configuracion;
import com.jkt.excepcion.JakartaException;
import com.jkt.operaciones.Operation;
import com.jkt.presupuesto.dominio.ItemResumen;
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

	private static final String WRITER_ARCHIVO = "comprobante";
	private static final String KEY_RUTA_COMPARTIDA = "rutaCompartida";
	private static final String EXTENSION = ".pdf";
	private static final String OID_PRESUPUESTO = "oid".toUpperCase();

	private String rutaCompartida;
	private Presupuesto p;
	
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
			Especificacion e = generarComprobante(p);
			notificarObjeto(WRITER_ARCHIVO, e);
		}else{
			throw new JakartaException("La ruta compartida debe terminar con el caracter 'barra' // ");
		}
		
		
		
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
			
			report.setDataSource(this.createDataSource());
			
			Map<String, Object> parameters=new HashMap<String, Object>();
			
			parameters.put("lugarFecha", String.format("%s, %s",p.getClienteSucursal().getDireccion().getProvincia().getDescripcion(), obtenerFechaActual()));			
			parameters.put("cliente", p.getClienteSucursal().getCliente().getSujetoImpositivo().getRazonSocial());
			
			parameters.put("calle", p.getClienteSucursal().getDireccion().getDireccion());
			
			String direccionCompleta=String.format("%s - %s (%s)", p.getClienteSucursal().getDireccion().getCodigoPostal(), p.getClienteSucursal().getDireccion().getProvincia().getDescripcion(), p.getClienteSucursal().getDireccion().getPais().getDescripcion());
			parameters.put("direccion", direccionCompleta);
			
			parameters.put("pais", p.getClienteSucursal().getDireccion().getPais().getDescripcion());

			String presentacion = "De Nuestra Consideracion.\nDe acuerdo con lo solicitado por Ustedes, tenemos el agrado de cotizarles las siguientes tareas a realizar en nuestro establecimiento:";
			parameters.put("presentacion", presentacion);

			parameters.put("contactoRef", p.getContactoReferencia().getApellidoYNombre());
			
			parameters.put("referencia", p.getReferencia());

			parameters.put("nroPresupuesto", p.getNro());
			
			//Ver el tema del tipo de clase y demas.Si mando Arrays.asList no recuerdo si funcionaba.
			List<String> notas=new ArrayList<String>();
			notas.add("Nota de venta 1");
			notas.add("River Plate");
			notas.add("Campeon ReCopa Sudamericana");
			notas.add("Plate Plate Plate Plate Plate");
			
			List<ItemResumen> lista = obtenerDetalles();
			
			parameters.put("items", lista);
			parameters.put("notas", notas);

			report.setParameters(parameters);
			nombreArchivo = generarNombreDeArchivo();

			OutputStream outputStream = new FileOutputStream(rutaCompartida.concat(nombreArchivo).concat(EXTENSION));

			report.toPdf(outputStream);
			outputStream.close();

			Especificacion especificacion = new Especificacion();
			especificacion.setNombre(nombreArchivo.concat(EXTENSION));
			especificacion.setRuta(rutaCompartida);
			return especificacion;
		
		} catch (DRException e) {
			e.printStackTrace();
			throw new JakartaException("No fue posible crear el comprobante.");
		}
	}

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
//					String.format("Precio: %1$,.2f  - Moneda: %s", detalle.getPrecio(), detalle.getMoneda().getDescripcion());
			referencia=detalle.getReferencia();
			cantidad=detalle.getCantidad();
			
			switch (detalle.getTipoDetalle()) {
			case PresupuestoDet.CHAR_ELECTRICO:
				descripcion=String.format("Determinación Laboratorio Eléctrico - Cantidad: %d - Determinacion: %s - Analisis: %s", cantidad ,detalle.getDeterminacion().getDescripcion());
				break;
			case PresupuestoDet.CHAR_QUIMICO:
				descripcion=String.format("Determinación Laboratorio Quimico - Cantidad: %d - Determinacion: %s - Analisis: %s", cantidad ,detalle.getDeterminacion().getDescripcion());
				break;
			case PresupuestoDet.CHAR_MATERIAL:
				descripcion=String.format("Tipo de venta: %s - Cantidad: %d - Producto: %s", String.valueOf(detalle.getTipoVenta()), cantidad, detalle.getProducto().getDescripcionAbrev());
				break;
			case PresupuestoDet.CHAR_ITEM:
				descripcion="items";
				break;
			default:
				throw new JakartaException("No se generará el comprobante debido a que los detalles del presupuesto son inconsistentes en cuanto a su tipo.");
			}
			
			data.add(new ItemResumen(String.valueOf(nroItem++), referencia, descripcion, precio));
			
		}
		
		return data;
	}

	private String obtenerFechaActual() {
        Calendar c1 = GregorianCalendar.getInstance();
	    SimpleDateFormat sdf = new SimpleDateFormat("dd-MMMMM-yyyy");
	    return sdf.format(c1.getTime());
	}

	private JRDataSource createDataSource() {
		List<ItemResumen> data = new ArrayList<ItemResumen>();
		
		List<PresupuestoDet> detalles = p.getDetalles();

		int nroItem=1;
		for (PresupuestoDet presupuestoDet : detalles) {
			data.add(new ItemResumen());
//			data.add(new ItemResumen("Item "+nroItem,presupuestoDet.getDescripcion(), "uutgut", String.valueOf(presupuestoDet.getPrecio())));
//			data.add(new ItemResumen("Item "+nroItem,presupuestoDet.getDescripcion(), "uutgut", String.valueOf(presupuestoDet.getPrecio())));
//			data.add(new ItemResumen("Item "+nroItem,presupuestoDet.getDescripcion(), "uutgut", String.valueOf(presupuestoDet.getPrecio())));
//			data.add(new ItemResumen("Item "+nroItem,presupuestoDet.getDescripcion(), "uutgut", String.valueOf(presupuestoDet.getPrecio())));
//			data.add(new ItemResumen("Item "+nroItem,presupuestoDet.getDescripcion(), "uutgut", String.valueOf(presupuestoDet.getPrecio())));
//			data.add(new ItemResumen("Item "+nroItem,presupuestoDet.getDescripcion(), "uutgut", String.valueOf(presupuestoDet.getPrecio())));
//			data.add(new ItemResumen("Item "+nroItem,presupuestoDet.getDescripcion(), "uutgut", String.valueOf(presupuestoDet.getPrecio())));
//			data.add(new ItemResumen("Item "+nroItem,presupuestoDet.getDescripcion(), "uutgut", String.valueOf(presupuestoDet.getPrecio())));
		}

		return new JRBeanCollectionDataSource(data);

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
