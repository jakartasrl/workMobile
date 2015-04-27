package com.jkt.laboratorio.dominio;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import com.jkt.dominio.Descriptible;

@Data
public class Variable extends Descriptible {
	
	private Determinacion determinacion;
	private boolean input;
//	private Expresion expresion;
	
	//TRANSIENT FIELDS
	private String expresion;
	private List<Variable> variables=new ArrayList<Variable>();
		
}
