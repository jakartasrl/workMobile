package com.jkt.util;

/**
 * Entry tiene la misma estructura que el Entry de un Mapa, pero para usar con digester necesito
 * que los atributos key y value sean modificables, por medio de un setter.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Entry {

	private String key;
	private String value;

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}
