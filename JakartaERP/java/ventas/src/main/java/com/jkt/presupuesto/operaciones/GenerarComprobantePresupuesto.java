package com.jkt.presupuesto.operaciones;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.Map;

import net.sf.dynamicreports.jasper.builder.JasperReportBuilder;
import net.sf.dynamicreports.report.builder.DynamicReports;
import net.sf.dynamicreports.report.exception.DRException;
import net.sf.jasperreports.engine.JREmptyDataSource;

import com.jkt.dominio.Configuracion;
import com.jkt.excepcion.JakartaException;
import com.jkt.laboratorio.operaciones.CrearDoc;
import com.jkt.operaciones.Operation;
import com.jkt.presupuesto.dominio.Presupuesto;
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
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		/*
		 * Valido el parametro obligatorio y recupero el presupuesto para generar el comprobante
		 */
		
		validarEntrada(aParams.get(OID_PRESUPUESTO));
		Presupuesto p = (Presupuesto) obtener(Presupuesto.class, (String)aParams.get(OID_PRESUPUESTO));

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
		InputStream is = CrearDoc.class.getResourceAsStream(retrieveTemplate());
		String nombreArchivo="";
		try {
			JasperReportBuilder report = DynamicReports.report();
			report.setTemplateDesign(is);
			report.setDataSource(new JREmptyDataSource(10));
			
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

	/**
	 * Recupera el nombre del template de jasper reports para aplicarlo al comprobante.
	 * Depende del tipo de reporte, el tipo de comprobante, etc etc.
	 * TODO definir bien esto...
	 */
	private String retrieveTemplate() {
		return "presupuesto1.jrxml";
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
