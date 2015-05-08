package com.jkt.ov;

import lombok.Data;

import com.jkt.view.ObjectView;

@Data
public class MenuOV extends ObjectView {

	private String nombre, enlace, tipo;
	
	private String operacion, clase;

	public MenuOV(String nombre, String enlace, String tipo) {
		super();
		this.nombre = nombre;
		this.enlace = enlace;
		this.tipo = tipo;
	}

	public MenuOV(String nombre, String enlace, String tipo,String operacion ,String clase) {
		super();
		this.nombre = nombre;
		this.enlace = enlace;
		this.tipo = tipo;
		this.operacion=operacion;
		this.clase=clase;
	}
	
	public static MenuOV newInstance(String nombre, String enlace, String tipo){
		return new MenuOV(nombre, enlace, tipo);
	}
	public static MenuOV newInstance(String nombre, String enlace, String tipo,String operacion, String clase){
		return new MenuOV(nombre, enlace, tipo, operacion, clase);
	}
	
}
