package com.jkt.transformers;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;

import com.jkt.excepcion.ExceptionDS;
import com.jkt.excepcion.JakartaException;
import com.jkt.framework.writers.XMLStreamMaker;
import com.jkt.framework.writers.XMLTableMaker;
import com.jkt.request.EventBusiness;
import com.jkt.xmlreader.CampoSalida;
import com.jkt.xmlreader.Output;

/**
 * Implementación generica de Transformer que utiliza varios writers, para esperar notificaciones de origenes paralelos.
 * Pueden llegar notificaciones de cualquier tipo a cualquier writer y al final se generará una salida coherente.
 * 
 * @see Notificacion
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ParalelResponseListenerTransformer extends Transformer {
	
	private ServletOutputStream servletOutputStream;
	
	/**
	 * Mapa con writers para poder escribir paralelamente
	 */
	private Map<String, XMLTableMaker> writers=new HashMap<String, XMLTableMaker>();

	public void addWriter(String nameOfWriter,ServletOutputStream outputStream){
		this.writers.put(nameOfWriter, new XMLTableMaker(nameOfWriter, outputStream));
	}

	@Override
	protected void update(Notificacion currentEntry) {
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
		for (CampoSalida currentFila : currentTable.getCamposDeSalida()) { 
			writer.addFila();
			for (CampoSalida currentColumna : currentFila.getCamposDeSalida()) {
				Object resultado;
				try {
					resultado = solver.resolveMethodInvocation(currentColumna.getTarget(), parameter);
				} catch (ExceptionDS e) {
					resultado=null;
					// TODO Auto-generated catch block
//					e.printStackTrace();
				} catch (NoSuchMethodException e) {
					resultado=null;
					// TODO Auto-generated catch block
//					e.printStackTrace();
				} 
				catch (SecurityException e) {
					resultado=null;
					// TODO Auto-generated catch block
//					e.printStackTrace();
				}
				if (resultado!=null) {
					writer.addColumna(currentColumna.getValue(), resultado);
				}else{
					//log this
				}
			}
		}
	}
	
	/**
	 * Escribe en cada uno de los writers el contenido acumulado sobre el servlet
	 * @throws JakartaException 
	 */
	public synchronized void write() throws JakartaException{
		
		/*
		 * Se instancia este maker para iniciar y cerrar los tags de respuesta.
		 */
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

	@Override
	public void setup(ServletOutputStream outputStream, String outputName) throws JakartaException {
		
//		if (outputName!=null || !outputName.equals("")) {
//			throw new JakartaException("El transformer paralelo no permite como salida un nombre recibido.No envíe el valor de la tabla de salida.");
//		}
		
		this.servletOutputStream=outputStream;
		List<Output> outputs = ((EventBusiness)this.getEvent()).getOutputs();
		String nameOfOutput = "";
		for (Output output : outputs) {
			nameOfOutput = output.getName();
			this.addWriter(nameOfOutput, outputStream);
		}
	}

}
