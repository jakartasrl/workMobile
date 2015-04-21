package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.view.ObjectView;

@Data
@EqualsAndHashCode(callSuper=true)
public class MetodoOV extends ObjectView {
	
	private String        		metodo;
	private DeterminacionOV 	determinacion = new DeterminacionOV();
	private ExpresionOV         expresion;
	private Long idExpresion;
	private String expresionCadena;
	
	private List<ValorEsperadoOV> valoresEsperados = new ArrayList<ValorEsperadoOV>();
	private List<VariableOV> variables = new ArrayList<VariableOV>();
	
	private long idDeterminacion;
	private long idVariable;
	
}
