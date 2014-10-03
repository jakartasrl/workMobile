package com.jkt.xmlreader;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>Esta clase representa a las listas de salida de los archivos de operaciones XML.</p>
 * 
 * <p><b>ESTE CAMPO ESTA ALTAMENTE RELACIONADO AL ATRIBUTO ENTIDAD DEL TAG OPERACIONES</b></p>
 * <p>Sin esta informacion no se a que entidad ir a buscar las listas.</p>
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Listas {

	private List<Lista> listas=new ArrayList<Lista>();
	
	
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
