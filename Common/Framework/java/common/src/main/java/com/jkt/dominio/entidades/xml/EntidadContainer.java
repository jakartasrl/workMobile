package com.jkt.dominio.entidades.xml;

import java.util.HashMap;
import java.util.Map;

public class EntidadContainer {

	private Map<String, Entidad> entidades = new HashMap<String, Entidad>();

	public Map<String, Entidad> getEntidades() {
		return entidades;
	}

	public void setEntidades(Map<String, Entidad> entidades) {
		this.entidades = entidades;
	}

	public void agregarEntidad(Entidad e){
		this.entidades.put(e.getNombre(), e);
	}
	
	public Entidad getEntidad(String keyName){
		return entidades.get(keyName);
	}
	
}
