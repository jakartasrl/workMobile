package com.jkt.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.commons.digester3.Digester;
import org.xml.sax.SAXException;

import com.jkt.excepcion.JakartaException;

/**
 * Utilidad para no utilizar el nombre completo de la clase.
 * TODO FIXME TODO Arreglar esto, sacarlo a un archivo hacia afuera!!!
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@SuppressWarnings("rawtypes")
public class RepositorioClases {

	static Map<String, String> alias = new HashMap<String, String>();
	static Map<String, String> validadores = new HashMap<String, String>();

	static {
		
		try {
			Digester digester = generarReglas();
			InputStream in = RepositorioClases.class.getResourceAsStream("clases.xml");
			List elementos=(List)digester.parse(in);

			Entry currentEntry;
			for (Object elemento : elementos) {
				currentEntry=(Entry) elemento;
				alias.put(currentEntry.getKey(), currentEntry.getValue());
				validadores.put(currentEntry.getValue(), currentEntry.getValidador());
			}
		} catch (IOException e) {
			throw new RuntimeException("Error de entrada/salida.");
		} catch (SAXException e) {
			throw new RuntimeException("Error de parseo en el archivo de configuracion xml.");
		}

	}

	/**
	 * @param value usado como key
	 * @return El valor completo de la clase
	 * @throws JakartaException
	 */
	public static String getClass(String value) throws JakartaException {
		String valueRetrieved = alias.get(value);
		if (valueRetrieved == null || valueRetrieved.isEmpty()) {
			throw new JakartaException("No existe la clase solicitada. Pruebe indicando la clase con minuscula y respetante la nomenclatura camelCase.");
		}
		return valueRetrieved;
	}
	
	/**
	 * Retorna el nombre de la clase del validador.
	 * Si no existe el validador de regla de negocio de retorna null.
	 * 
	 * @param value
	 * @return
	 * @throws JakartaException
	 */
	public static String getValidador(String value) throws JakartaException {
		String valueRetrieved = validadores.get(value);
		return valueRetrieved;
	}

	private static Digester generarReglas() {
		Digester digester = new Digester();
		digester.setValidating(false);
		
		digester.addObjectCreate("elementos", ArrayList.class);
		
		digester.addObjectCreate("elementos/elemento", Entry.class.getName());
		digester.addSetProperties("elementos/elemento");
		digester.addSetNext("elementos/elemento", "add", Entry.class.getName());

		return digester;
	}

}
