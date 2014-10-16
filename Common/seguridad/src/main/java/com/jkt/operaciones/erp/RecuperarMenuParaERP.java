package com.jkt.operaciones.erp;

import java.util.Map;

import com.jkt.dominio.Container;
import com.jkt.operaciones.Operation;

/**
 * Operacion que solo deberia ser usada por la aplicaci�n ERP, y sirve para recuperar el ID del level 0 de su menu.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class RecuperarMenuParaERP extends Operation {

	/*
	 * Este valor deberia estar en una tabla de parametrizaci�n en la base
	 */
	private static final long VALUE_OF_MENU = 1L;

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		notificarObjecto("resultado", new Container(String.valueOf(VALUE_OF_MENU)));
	}

}
