package com.jkt.xmlreader;

import java.util.ArrayList;
import java.util.List;


public class XMLEvento {
	private String clase;
	private List<XMLObservador> observadores = new ArrayList<XMLObservador>();

	public String getClase() {
		return clase;
	}

	public void setClase(String clase) {
		this.clase = clase;
	}

	public List<XMLObservador> getObservadores() {
		return observadores;
	}

	public void setObservadores(List<XMLObservador> observadores) {
		this.observadores = observadores;
	}
	
	public void addObservador(XMLObservador obs){
		this.observadores.add(obs);
	}

}