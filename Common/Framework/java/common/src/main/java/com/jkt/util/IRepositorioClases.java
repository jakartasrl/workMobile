package com.jkt.util;

import com.jkt.excepcion.JakartaException;

public interface IRepositorioClases {

	
	public String getClass(String value) throws JakartaException;
	
	/**
	 * Retorna el nombre de la clase del validador.
	 * Si no existe el validador de regla de negocio de retorna null.
	 * 
	 * @param value
	 * @return
	 * @throws JakartaException
	 */
	public String getValidador(String value) throws JakartaException;

}
