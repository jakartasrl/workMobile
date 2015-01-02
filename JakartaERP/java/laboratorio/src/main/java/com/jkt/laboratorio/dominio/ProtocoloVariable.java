package com.jkt.laboratorio.dominio;

import com.jkt.dominio.PersistentEntity;

/**
 * <p>Representa las variables obtenidas en los resultados de las determinaciones.</p>
 * <p>Se utilizar� para la gesti�n del laboratorio, para el c�lculo del resultado.</p>
 */
public class ProtocoloVariable extends PersistentEntity {

	private String variable;
	private String valor;

	public String getVariable() {
		return variable;
	}

	public void setVariable(String variable) {
		this.variable = variable;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

}
