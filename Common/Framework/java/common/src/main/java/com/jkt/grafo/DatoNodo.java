package com.jkt.grafo;

import com.jkt.dominio.Descriptible;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;

/**
 * DatoNodo es una clase que debe ser implementada con el fin de ser utilizada
 * para completar el dato crudo de un grafo.
 * 
 * Esta entidad contendra logica para pasar a finalizado el estado, validar si
 * se puede cambiar el estado, y obviamente toda la logica de negocio necesaria.
 * 
 * Leonel Suarez - Jakarta SRL
 */
abstract public class DatoNodo extends Descriptible{

	public enum Estado {
		NO_INICIADO, EN_EJECUCION, FINALIZADO;
	}
	
	private Estado estado=Estado.NO_INICIADO;
	
	
	/**
	 * Logica interna para ver si se puede completar la 'tarea'.
	 * Depende mucho de la logica de negocio
	 * 
	 * @return true o false si se puede completar
	 * @throws JakartaException 
	 */
	abstract protected boolean sePuedeFinalizar() throws JakartaException;

	/**
	 * Logica interna para ver si se puede completar la 'tarea'.
	 * Depende mucho de la logica de negocio
	 * 
	 * @return true o false si se puede completar
	 * @throws JakartaException 
	 */
	abstract protected boolean sePuedeIniciar() throws JakartaException;

	
	public void completar() throws JakartaException{
		
		if(sePuedeFinalizar()){
			estado=Estado.FINALIZADO;
		}
	}
	
	/**
	 * @return true si esta finalizado, falso en caso contrario
	 */
	public boolean estaCompleto(){
		if (Estado.FINALIZADO.equals(estado)) {
			return true;
		}
		return false;
	}
	
}
