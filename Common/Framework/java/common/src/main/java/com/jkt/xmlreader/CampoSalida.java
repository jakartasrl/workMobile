package com.jkt.xmlreader;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.collections.Closure;
import org.apache.commons.collections.CollectionUtils;

/**
 * Representa al tag campoSalida de operaciones.
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class CampoSalida extends XMLEntity {

	private String target;
	
	/*
	 * Campos definidos desde el XML def.
	 * Ya los tiene el padre, entonces no los declaro acá.
	 * 
	 * 
	 * 	private String value;
	 *	private String tableName;
	 */

	public CampoSalida getHijo(String key) {
		return (CampoSalida) super.getHijo(key);
	}

	/**
	 * Segun la definicion del XML, solamente CampoSalida puede tener hijo de
	 * CampoSalida, entonces no se realiza la verificacion de tipos
	 * 
	 * @return
	 */
	public boolean tieneHijos() {
		return !this.getHijos().isEmpty();
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	/**
	 * De todos sus hijos, retorna solamente los de tipo CampoSalida.
	 * 
	 * @return List<CampoSalida> que representa a una lista de campos de salida.
	 */
	public List<CampoSalida> getCamposDeSalida(){
		Collection collectionSons = this.getHijos();
		
		final List<CampoSalida> result=new ArrayList<CampoSalida>();
		CollectionUtils.forAllDo(collectionSons, new Closure() {
			
			public void execute(Object arg0) {
				if(arg0 instanceof CampoSalida){
					result.add((CampoSalida)arg0);
				}
				
			}
		});
		return result;
	}

}
