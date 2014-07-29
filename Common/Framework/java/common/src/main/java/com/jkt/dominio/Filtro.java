package com.jkt.dominio;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Filtro extends PersistentEntity {

	private String clase;
	private List<Par> valores=new ArrayList<Par>();
	
	public String getClase() {
		return clase;
	}
	public void setClase(String clase) {
		this.clase = clase;
	}
	public List<Par> getValores() {
		return valores;
	}
	public void setValores(List<Par> valores) {
		this.valores = valores;
	}
	public void addValor(Par par){
		this.valores.add(par);
	}
	
	/**
	 * Pasa los valores de la lista de Pares a un mapa comun y corriente
	 * 
	 * @return
	 */
	public Map<String,String> valoresToMap(){
		Map<String, String> hashMap = new HashMap<String, String>();
		for (Par par : valores) {
			hashMap.put(par.getCampo(), par.getValor());
		}
		return hashMap;
	}
	
}
