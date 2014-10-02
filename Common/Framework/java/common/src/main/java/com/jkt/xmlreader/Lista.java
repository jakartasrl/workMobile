package com.jkt.xmlreader;

/**
 * <p>
 * Componente que será agregado a las Listas
 * </p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Lista {

	private String nombreWriter;//nombre del writer que se corresponde con una tabla y matchea toda información de salida.
	private String nombreLista;//nombre exacto del atributo que representa a una lista

	public String getNombreWriter() {
		return nombreWriter;
	}

	public void setNombreWriter(String nombreWriter) {
		this.nombreWriter = nombreWriter;
	}

	public String getNombreLista() {
		return nombreLista;
	}

	public void setNombreLista(String nombreLista) {
		this.nombreLista = nombreLista;
	}

}
