package com.jkt.contexto;

import lombok.Data;

@Data
public class PropiedadMatricial {
	
	private String 	nombre; 
	
	private long 	idValorPrimario;
	private double 	valorPrimario;
	
	private long 	idValorSecundario;
	private double 	valorSecundario;
	
	private long  	idValorTerciario;
	private double 	valorTerciario;

}
