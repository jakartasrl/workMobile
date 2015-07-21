package com.jkt.laboratorio.dominio;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.dominio.Descriptible;

@Data
@EqualsAndHashCode(callSuper=true)
public class Variable extends Descriptible {
	
	private boolean input;
	private boolean resultadoFinal;
	private double resultadoExpresion;
	
	//TRANSIENT FIELDS
	private String expresion;
	private List<Variable> variables=new ArrayList<Variable>();
	
	private long idTmp;
	
	private double valorInput;

}
