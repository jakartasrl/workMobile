package com.jkt.transformers;

import java.io.IOException;

import javax.servlet.ServletOutputStream;

import com.jkt.excepcion.ExceptionDS;
import com.jkt.excepcion.JakartaException;
import com.jkt.framework.writers.AbsWriter;
import com.jkt.framework.writers.XMLStreamMaker;
import com.jkt.request.EventBusiness;
import com.jkt.xmlreader.CampoSalida;
import com.jkt.xmlreader.Output;

/**
 * 
 * Transformer simple, el cual se encarga de escribir en la salida a medida que se notifican eventos.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class SimpleTransformer extends Transformer {

	private String outputName;
	private boolean flag=false;
	
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
		
		if (!flag) {
			try {
				iniciar();
				flag=true;
			} catch (IOException e) {
				throw new RuntimeException(e);
			} catch (JakartaException e) {
				throw new RuntimeException(e);
			}
		}
		
		if (arg1 != null) { //SOLAMENTE SE PREGUNTA ESO PARA CERRAR CON EL METODO WRITER Y PODER DARLE LOS TAGS DE CIERRE AL TAG TABLA.

			Object instance = (Object) arg1.getParameter();

			EventBusiness eventBusiness=(EventBusiness) this.getEvent();
	
			// 1- Por cada OUTPUT se genera una tabla.
			for (Output currentTable : eventBusiness.getOutputs()) {
				// 2 - Por cada CAMPOSALIDA que tenga esa tabla, se genera una FILA
				this.getWriter().addFila();
					
				for (CampoSalida currentColumna : currentTable.getCamposDeSalida()) {
					// 3 - Por cada CAMPOSALIDA que tenga esa fila, se genera una COLUMNA
					Object resultado;
					try {
						resultado = solver.resolveMethodInvocation(currentColumna.getTarget(), instance);
					} catch (ExceptionDS e) {
						resultado=null;
					} catch (NoSuchMethodException e) {
						resultado=null;
					} catch (SecurityException e) {
						resultado=null;
					}
					if (resultado!=null) {
						this.getWriter().addColumna(currentColumna.getValue(), resultado);
					}else{
						//TODO loguear algo y continuar con el siguiente campo!!!!
					}
				}
			}
		}
	}

	/**
	 * Escribe en cada uno de los writers el contenido acumulado sobre el servlet
	 * @throws JakartaException 
	 */
	public synchronized void write() throws JakartaException{
		try {
			//Si nunca se notifico nada, necesito abrir los tag de la tabla en cuestion.Por mas que luego vayan vacios.
			if (!flag) {
				iniciar();
			}
			getWriter().write();
			getWriter().writeEndTag();
		} catch (IOException e) {
			throw new JakartaException("Ocurrio un error al escribir en la salida.");
		}
	}

	@Override
	public void setup(ServletOutputStream outputStream, String ouputName) throws JakartaException {
		XMLStreamMaker xmlStreamMaker = new XMLStreamMaker();
		xmlStreamMaker.setStream(outputStream);
		setWriter(xmlStreamMaker);
		this.outputName=ouputName;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	
	/**
	 * Inicia una tabla en caso de que aun no se haya generado alguna.
	 * Es el metodo que se ejecuta segun el valor de la variable flag
	 * @throws IOException
	 * @throws JakartaException
	 */
	public void iniciar() throws IOException, JakartaException{
		getWriter().writeStartTag();
		EventBusiness eventBusiness=(EventBusiness) this.getEvent();
		Output oElement = (Output)eventBusiness.getHijoOutput("resultado");
		getWriter().addTabla(outputName==null?oElement.getTableName():outputName);
	}
	
	
}
