package com.jkt.dominio;

/**
 * <p>Representa a un comprobante.</p>
 * <p>Esta clase sera super clase de todo tipo de comprobante.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public abstract class Comprobante extends PersistentEntity {

	/*
	 * variables de instancia
	 * ***********************************************
	 */
	private String comportamiento;
	private char letra;
	private String lugarEmision;
	private int nro;
	private boolean anulado;
	/*
	 * variables de instancia
	 * ***********************************************
	 */
	
	
	public String getComportamiento() {
		return comportamiento;
	}
	public void setComportamiento(String comportamiento) {
		this.comportamiento = comportamiento;
	}
	public char getLetra() {
		return letra;
	}
	public void setLetra(char letra) {
		this.letra = letra;
	}
	public String getLugarEmision() {
		return lugarEmision;
	}
	public void setLugarEmision(String lugarEmision) {
		this.lugarEmision = lugarEmision;
	}
	public int getNro() {
		return nro;
	}
	public void setNro(int nro) {
		this.nro = nro;
	}
	public boolean isAnulado() {
		return anulado;
	}
	public void setAnulado(boolean anulado) {
		this.anulado = anulado;
	}
	
}
