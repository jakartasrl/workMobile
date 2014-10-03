package com.jkt.xmlreader;

import java.util.ArrayList;
import java.util.List;

/**
 * <p> Componente que será agregado a las Listas </p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Lista {

	private String nombreWriter;//nombre del writer que se corresponde con una tabla y matchea toda información de salida.
	private String nombreLista;//nombre exacto del atributo que representa a una lista
	private List<Lista> listas=new ArrayList<Lista>();

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

	public boolean tieneHijos(){
		return !listas.isEmpty();
	}
	
	public List<Lista> getListas() {
		return listas;
	}

	public void setListas(List<Lista> listas) {
		this.listas = listas;
	}

	public void addLista(Lista l){
		listas.add(l);
	}
	
}
