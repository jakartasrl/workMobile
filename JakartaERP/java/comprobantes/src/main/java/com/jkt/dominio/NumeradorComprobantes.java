package com.jkt.dominio;

public class NumeradorComprobantes extends PersistentEntity {

	private String argumento; // TS-OTRO-VALOR
	private int numero;

	public String getArgumento() {
		return argumento;
	}

	public void setArgumento(String argumento) {
		this.argumento = argumento;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public void aumentarNumero() {
		this.numero++;
	}

}
