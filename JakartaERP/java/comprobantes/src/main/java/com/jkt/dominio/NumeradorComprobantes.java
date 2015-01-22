package com.jkt.dominio;

/**
 * <p>Un numerador tiene como objetivo el llevar un contador de numeros segun el tipo de comprobante que posee determinado comprobante.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class NumeradorComprobantes extends PersistentEntity {

//	private String argumento; // TS-IDCOMPROBANTE-VALOR
	private int numero;

//	public String getArgumento() {
//		return argumento;
//	}
//
//	public void setArgumento(String argumento) {
//		this.argumento = argumento;
//	}
//
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
