package com.jkt.ov;

import lombok.Data;

import com.jkt.view.ObjectView;

@Data
public class MenuOV extends ObjectView {

	private String nombre, enlace, tipo;

	public MenuOV(String nombre, String enlace, String tipo) {
		super();
		this.nombre = nombre;
		this.enlace = enlace;
		this.tipo = tipo;
	}
	
	public static MenuOV newInstance(String nombre, String enlace, String tipo){
		return new MenuOV(nombre, enlace, tipo);
	}
	
}
