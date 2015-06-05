package com.jkt.grafo;

import lombok.Data;

import com.jkt.dominio.Descriptible;
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
@Data
abstract public class DatoNodo extends Descriptible{

	public enum Estado {
		
		EN_ESPERA(1) {
			@Override
			public String getDescripcion() {
				return "En espera de precedentes";
			}
			
		},
		
		NO_INICIADO(2) {
			@Override
			public String getDescripcion() {
				return "No Iniciado";
			}
			
		}, 
		
		EN_EJECUCION(3) {
			@Override
			public String getDescripcion() {
				return "En Ejecución";
			}
			
		},
		FINALIZADO(4) {
			@Override
			public String getDescripcion() {
				return "Tarea Completa";
			}
			
		};
		
		private int value;
		public abstract String getDescripcion();

		private Estado (int value){
			this.value=value;
		}
		
		public int getValue(){
			return this.value;
		}
		
		/**
		 * Obtiene un elemento de la enumeracion recibiendo un entero.
		 * 
		 */
		public static Estado getEstado(int value) throws JakartaException{
			Estado[] values = values();
			Estado c = null;
			for (Estado comportamiento : values) {
				if(comportamiento.getValue()==value){
					c=comportamiento;
					break;
				}
			}
			if (c==null) {
				throw new JakartaException("No existe un comportamiento para la solicitud recibida.");
			}
			return c;
		}
		
	}
	
	private Estado estado=Estado.NO_INICIADO;
	private int idEstado=Estado.NO_INICIADO.getValue();
	
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
