package com.jkt.util;

import java.util.HashMap;
import java.util.Map;

import com.jkt.excepcion.JakartaException;

/**
 * Utilidad para no utilizar el nombre completo de la clase.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class RepositorioClases {

	static Map<String, String> mapa = new HashMap<String, String>();

	static {
		mapa.put("usuario", "com.jkt.dominio.Usuario");
		mapa.put("empresa", "com.jkt.dominio.Empresa");

		mapa.put("idioma", "com.jkt.varios.Idioma");
		mapa.put("pais", "com.jkt.varios.Pais");
		mapa.put("provincia", "com.jkt.varios.Provincia");

		mapa.put("vendedor", "com.jkt.erp.varios.Vendedor");
		mapa.put("representante", "com.jkt.erp.varios.Representante");
		mapa.put("zonaComercial", "com.jkt.erp.varios.ZonaComercial");
	
	}

	/**
	 * @param value usado como key
	 * @return El valor completo de la clase
	 * @throws JakartaException
	 */
	public static String getClass(String value) throws JakartaException {
		String valueRetrieved = mapa.get(value);
		if (valueRetrieved == null || valueRetrieved.isEmpty()) {
			throw new JakartaException("No existe la clase solicitada");
		}
		return valueRetrieved;
	}

}
