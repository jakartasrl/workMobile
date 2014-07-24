package com.jkt.xmlreader;

import java.util.HashMap;
import java.util.Map;

public class XMLEventos {

	private Map<String, XMLEvento> eventos = new HashMap<String, XMLEvento>();

	public void addEvento(XMLEvento evt) {
		this.eventos.put(evt.getClase(), evt);
	}

	public Map<String, XMLEvento> getEventos() {
		return eventos;
	}

	public void setEventos(Map<String, XMLEvento> eventos) {
		this.eventos = eventos;
	}

}
