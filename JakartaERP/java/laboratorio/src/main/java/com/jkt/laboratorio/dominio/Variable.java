package com.jkt.laboratorio.dominio;

import lombok.Data;

import com.jkt.dominio.Descriptible;

@Data
public class Variable extends Descriptible {
	
	private Determinacion determinacion;
	private boolean input;
	private Expresion expresion;
		
}
