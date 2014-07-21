package com.jkt.xmlreader;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.collections.Closure;
import org.apache.commons.collections.CollectionUtils;

import com.jkt.request.EventBusiness;

/**
 * Cada OUTPUT representará a una tabla en la salida de los transformadores.
 * 
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Output extends EventBusiness{
	
	
	
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
