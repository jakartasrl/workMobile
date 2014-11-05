package com.jkt.xmlreader;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.collections.Closure;
import org.apache.commons.collections.CollectionUtils;

import com.jkt.request.EventBusiness;

public class Input extends EventBusiness{
	
	private String nombreEntidad;
	private String nameOV;
	
	public String getNombreEntidad() {
		return nombreEntidad;
	}

	
	public void setName(String name) {
		this.name = name.toUpperCase();
	}

	public void setNombreEntidad(String nombreEntidad) {
		this.nombreEntidad = nombreEntidad;
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


	public String getNameOV() {
		return nameOV;
	}

	public void setNameOV(String nameOV) {
		this.nameOV = nameOV;
	}
}
