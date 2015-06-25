package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import lombok.Data;

import com.jkt.view.ObjectView;

@Data
public class MenuOV extends ObjectView {

	private String name;
	private String img;
	private String size;
	private String theme;
	private String link;
	private String type;
	private String url=StringUtils.EMPTY;
	

	
//	private String nombre, enlace, tipo;
//	
//	private String operacion, clase;
//
//	private List<MenuOV> hijos =  new ArrayList<MenuOV>();
//	
//	public MenuOV(String nombre, String enlace, String tipo) {
//		super();
//		this.nombre = nombre;
//		this.enlace = enlace;
//		this.tipo = tipo;
//	}
//
//	public MenuOV(String nombre, String enlace, String tipo,String operacion ,String clase) {
//		super();
//		this.nombre = nombre;
//		this.enlace = enlace;
//		this.tipo = tipo;
//		this.operacion=operacion;
//		this.clase=clase;
//	}
//	
//	public MenuOV() {}
//	
//	public static MenuOV newInstance(String nombre, String enlace, String tipo){
//		return new MenuOV(nombre, enlace, tipo);
//	}
//	public static MenuOV newInstance(String nombre, String enlace, String tipo,String operacion, String clase){
//		return new MenuOV(nombre, enlace, tipo, operacion, clase);
//	}
	
}
