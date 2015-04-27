package com.jkt.ov;

import lombok.Data;

import com.jkt.view.ObjectView;

@Data
public class FiltroOV extends ObjectView {

	private String nombre, valor, condicion, tipoDeDato;

	public FiltroOV(String nombre, String valor, String condicion,
			String tipoDeDato) {
		super();
		this.nombre = nombre;
		this.valor = valor;
		this.condicion = condicion;
		this.tipoDeDato = tipoDeDato;
	}


	
	
}
