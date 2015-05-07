package com.jkt.grafo;

import com.jkt.excepcion.JakartaException;

public class TareaPedido extends DatoNodo {
	
	
	/*
	 * Estos metodos quedan sin utilidad, ya que serán utilizados para entidades mas complejas.
	 * En muchas circunstancias se puede dar que el dato del nodo defina si se puede completar la tarea, internamente, 
	 * sin tener en cuenta las precedencias y posteriores.
	 * 
	 */
	
	@Override
	protected boolean sePuedeFinalizar() throws JakartaException {
		return true;
	}

	@Override
	protected boolean sePuedeIniciar() throws JakartaException {
		return true;
	}

}
