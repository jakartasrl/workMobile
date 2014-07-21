package com.jkt.transformers;

/**
 * La clase Notificacion es usada para enviar como parametro en una notificación.
 * Se usa para saber que writer se debe escribir y q parametro sera enviado.
 * 
 * 
 * @see SimpleTransformer Si es simple transformer solamente necesita contenido en el campo parameter.
 * @see ParalelResponseListenerTransformer Si es ParalelResponseListenerTransformer es primordial que la {@link Notificacion} tenga todos los campos completos 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Notificacion {

	private Notificacion() {}	
	
	/**
	 * Metodo de clase para instanciar una nueva {@link Notificacion}
	 * 
	 * @param writerKey
	 * @param parameter
	 * @return
	 */
	public static Notificacion getNew(String writerKey, Object parameter){
		Notificacion entry = new Notificacion();
		entry.writerKey=writerKey;
		entry.parameter=parameter;
		return entry;
	}
	
	private String writerKey;
	private Object parameter;

	public String getWriterKey() {
		return writerKey;
	}

	public Object getParameter() {
		return parameter;
	}

}
