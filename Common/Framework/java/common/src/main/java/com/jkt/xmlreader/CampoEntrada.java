package com.jkt.xmlreader;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.collections.Closure;
import org.apache.commons.collections.CollectionUtils;

public class CampoEntrada extends XMLEntity {

	private String name;
	private String clase;
	private String metodo;
	private String propertyOV;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name.toUpperCase();
	}

	public String getClase() {
		return clase;
	}

	public void setClase(String clase) {
		this.clase = clase;
	}

	public String getMetodo() {
		return metodo;
	}

	public void setMetodo(String metodo) {
		this.metodo = metodo;
	}
	
	public CampoEntrada getHijo(String key){
		return (CampoEntrada)super.getHijo(key);
	}

	/**
	 * De todos sus hijos, retorna solamente los de tipo CampoEntrada.
	 * 
	 * @return
	 */
	public List<CampoEntrada> getCamposDeEntrada(){
		Collection collectionSons = this.getHijos();
		
		final List<CampoEntrada> result=new ArrayList<CampoEntrada>();
		CollectionUtils.forAllDo(collectionSons, new Closure() {
			
			public void execute(Object arg0) {
				if(arg0 instanceof CampoEntrada){
					result.add((CampoEntrada)arg0);
				}
				
			}
		});
		return result;
	}

	public String getPropertyOV() {
		return propertyOV;
	}

	public void setPropertyOV(String propertyOV) {
		this.propertyOV = propertyOV;
	}
}
