package com.jkt.ov;

import lombok.Data;

import com.jkt.view.ObjectView;

@Data
public class PropiedadMatricialOV extends ObjectView {
	
	private String 	nombre; 
	
	private long 	idValorPrimario;
	private double 	valorPrimario;
	
	private long 	idValorSecundario;
	private double 	valorSecundario;
	
	private long  	idValorTerciario;
	private double 	valorTerciario;

}
