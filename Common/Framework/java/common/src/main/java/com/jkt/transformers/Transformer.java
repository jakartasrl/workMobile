package com.jkt.transformers;

import java.io.IOException;
import java.util.Observable;
import java.util.Observer;

import javax.servlet.ServletOutputStream;

import com.jkt.excepcion.JakartaException;
import com.jkt.operaciones.Operation;
import com.jkt.request.IEventBusiness;
import com.jkt.xmlreader.PropertySolver;

/**
 * Un transformer es una clase que se encarga de tomar la estructura desde un
 * objeto previamente parseado desde un XML, el cual contiene informacion del
 * formato de respuesta. Cada operación puede tener un transformer para ser
 * notificado desde la misma y escribir (o no) este resultado en la salida de la
 * peticion.
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public abstract class Transformer implements Observer {

	//variable de clase, compartida por todos los CampoSalida
	protected static PropertySolver solver=new PropertySolver();
	
	private IEventBusiness event;
	private boolean        test;
	
	public IEventBusiness getEvent() {
		return event;
	}

	public void setEvent(IEventBusiness event) {
		this.event = event;
	}
	
	public void setTest(boolean aTest){
		test = aTest;
	}

	public void update(Observable arg0, Object arg1) {
		
		// Validación para todos los transformers, la cual indica que se puede
		// recibir notificaciones solamente desde operaciones.
		if (!Operation.class.isAssignableFrom(arg0.getClass())) {
			throw new RuntimeException("Los transformers solo puede aceptar notificaciones de operaciones.");
		}
//		arg1 es instancia de notificacion!
		
		if (arg1 instanceof Notificacion) {
			Notificacion notificacion = (Notificacion) arg1;
			this.update(notificacion);
		}else{
			throw new RuntimeException("Debe notificar enviando un objeto de tipo "+Notificacion.class);
		}
		
	}

	/**
	 * Metodo que se ejecuta al ser notificada alguna instancia de esta clase por algun Observable
	 * 
	 * @param Notificacion 
	 */
	protected abstract void update(Notificacion arg1);
	
	/**
	 * Escribe en la salida del servlet segun el formato definido.
	 * Obviamente, si no se ejecuta las lineas para escribir, este metodo no tendra efecto sobre la salida.
	 * 
	 * @throws JakartaException
	 */
	public abstract void write() throws JakartaException;
	/**
	 * Inicializar los writers, formato de salida, headers, etc.
	 * 
	 * @param outputStream
	 * @throws JakartaException
	 */
	public abstract void setup(ServletOutputStream outputStream, String outputName) throws JakartaException;
	
}
