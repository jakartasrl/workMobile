package com.jkt.dominio.entidades.xml;

/**
 * Equivalente al TAG OPERACION del archivo metadata.xml
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Operacion {

	private String operSave, operTraer;

	public String getOperSave() {
		return operSave;
	}

	public void setOperSave(String operSave) {
		this.operSave = operSave;
	}

	public String getOperTraer() {
		return operTraer;
	}

	public void setOperTraer(String operTraer) {
		this.operTraer = operTraer;
	}

}
