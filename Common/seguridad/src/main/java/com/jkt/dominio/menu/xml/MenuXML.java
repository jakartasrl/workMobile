package com.jkt.dominio.menu.xml;

import java.util.HashMap;
import java.util.Map;

import lombok.Data;

/**
 * Entidad que representa lo mapeado desde un XML con digester.
 *
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class MenuXML {

	private String codigo;
	private String name;
	private String img;
	private String size;
	private String theme;	
	private String link;
	private String type;
	
	private Map<String,MenuXML> hijos=new HashMap<String,MenuXML>();//Representa a los hijos

	public void agregarHijo(MenuXML elemento){
		this.hijos.put(elemento.getCodigo(), elemento);
	}
	
}
