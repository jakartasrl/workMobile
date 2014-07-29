package com.jkt.util;

import java.util.HashMap;
import java.util.Map;

/**
 * Representa al TAG CAMPOS de la solcitud recibida desde delphi
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class Campos implements IMapRequest {

	private Map<String,String> campos=new HashMap<String,String>();

	public Map<String, String> getCampos() {
		return campos;
	}

	public void setCampos(Map<String, String> campos) {
		this.campos = campos;
	}
	
	/**
	 * Agrega un valor al mapa
	 * 
	 * @param key - llave del elemento
	 * @param value - valor del elemento
	 */
	public void agregarAtributo(String key, String value){
		campos.put(key, value);
	}

	public Object put(Object aKey, Object aValue) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean contains(Object aKey) {
		return campos.containsKey(aKey);
	}
	
	
}
