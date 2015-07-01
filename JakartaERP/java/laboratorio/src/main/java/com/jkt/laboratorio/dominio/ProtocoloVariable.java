package com.jkt.laboratorio.dominio;

import lombok.Data;

import com.jkt.dominio.PersistentEntity;

/**
 * <p>Representa las variables obtenidas en los resultados de las determinaciones.</p>
 * <p>Se utilizara para la gestion del laboratorio, para el calculo del resultado.</p>
 */
@Data
public class ProtocoloVariable extends PersistentEntity {

	private String variable;
	private String expresion; //Si no es input
	private double valor;
	
	private boolean input;
	
	private double resultadoExpresion;

}
