package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=true)
public class VariableOV extends DescriptibleOV {
	
	private boolean input;
	private ExpresionOV expresion;
	
	private Long idExpresion;
	private String expresionCadena;
	private List<VariableOV> variables=new ArrayList<VariableOV>();
	
	
}
