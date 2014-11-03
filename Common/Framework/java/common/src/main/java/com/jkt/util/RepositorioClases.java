package com.jkt.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.apache.commons.digester3.Digester;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.xml.sax.SAXException;

import com.jkt.excepcion.JakartaException;

/**
 * Utilidad para no utilizar el nombre completo de la clase.
 * TODO FIXME TODO Arreglar esto, sacarlo a un archivo hacia afuera!!!
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@SuppressWarnings("rawtypes")
@Component
@Scope(value=ConfigurableBeanFactory.SCOPE_SINGLETON)
public class RepositorioClases implements IRepositorioClases{

	//variable que contiene todas las clases creadas.Esto es para evitar el uso de reflection y creaci�n de clases manualmente
//	private Map<String, Class> clases=new HashMap<String, Class>();
	
	private Map<String, String> alias = new HashMap<String, String>();
	private Map<String, String> validadores = new HashMap<String, String>();
	private Map<String, String> reglas = new HashMap<String, String>();

	@Autowired
	private ServletContext servletContext;
	
	@PostConstruct
	public void initMethod() {
		try {
			Digester digester = generarReglas();
			InputStream in = servletContext.getResourceAsStream("/WEB-INF/clases.xml");
			List elementos=(List)digester.parse(in);

			Entry currentEntry;
			for (Object elemento : elementos) {
				currentEntry=(Entry) elemento;
				alias.put(currentEntry.getKey(), currentEntry.getValue());
				validadores.put(currentEntry.getValue(), currentEntry.getValidador());
				reglas.put(currentEntry.getValue(), currentEntry.getRegla());
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
	public String getClass(String value) throws JakartaException {
		String valueRetrieved = alias.get(value);
		if (valueRetrieved == null || valueRetrieved.isEmpty()) {
			throw new JakartaException(String.format("No existe la clase '%s' . Pruebe indicando la clase con minuscula y respetante la nomenclatura camelCase.",value));
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
	public String getValidador(String value) throws JakartaException {
		String valueRetrieved = validadores.get(value);
		return valueRetrieved;
	}

	private Digester generarReglas() {
		Digester digester = new Digester();
		digester.setValidating(false);
		
		digester.addObjectCreate("elementos", ArrayList.class);
		
		digester.addObjectCreate("elementos/elemento", Entry.class.getName());
		digester.addSetProperties("elementos/elemento");
		digester.addSetNext("elementos/elemento", "add", Entry.class.getName());

		return digester;
	}

	public String getRegla(String value) throws JakartaException {
		String valueRetrieved = reglas.get(value);
		return valueRetrieved;
	}

}
