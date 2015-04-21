package com.jkt.ov;

import com.jkt.laboratorio.dominio.Expresion;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=true)
public class VariableOV extends DescriptibleOV {
	
	private boolean input;
	private ExpresionOV expresion;
	
	private Long idExpresion;
	private String expresionCadena;

}
