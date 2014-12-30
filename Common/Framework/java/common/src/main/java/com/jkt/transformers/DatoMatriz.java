package com.jkt.transformers;

/**
 * Clase para mostrar una salida del tipo:
 * 
 * dato | fecha1 | fecha2 | fecha3 | fecha4
 * peso |  hoy   |  ayer  | antesd | mucho
 * euro |  hoy   |  ayer  | antesd | mucho
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class DatoMatriz {

	private String referencia;
	private String dato1, dato2, dato3, dato4, dato5;
	
	private String idElemento;
	private String valor;
	

	public String getIdElemento() {
		return idElemento;
	}
	public void setIdElemento(String idElemento) {
		this.idElemento = idElemento;
	}
	public String getValor() {
		return valor;
	}
	public void setValor(String valor) {
		this.valor = valor;
	}
	public String getDato1() {
		return dato1;
	}
	public void setDato1(String dato1) {
		this.dato1 = dato1;
	}
	public String getDato2() {
		return dato2;
	}
	public void setDato2(String dato2) {
		this.dato2 = dato2;
	}
	public String getDato3() {
		return dato3;
	}
	public void setDato3(String dato3) {
		this.dato3 = dato3;
	}
	public String getDato4() {
		return dato4;
	}
	public void setDato4(String dato4) {
		this.dato4 = dato4;
	}
	public String getDato5() {
		return dato5;
	}
	public void setDato5(String dato5) {
		this.dato5 = dato5;
	}
	public String getReferencia() {
		return referencia;
	}
	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}
	
}
