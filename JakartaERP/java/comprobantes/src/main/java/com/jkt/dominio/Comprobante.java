package com.jkt.dominio;

import java.util.Date;


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
	private TipoComprobante tipoComprobante;
	private Date fecha;
	
	/*
	 * variables de instancia
	 * ***********************************************
	 */
	
	public String getComportamiento() {
		return comportamiento;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public TipoComprobante getTipoComprobante() {
		return tipoComprobante;
	}
	public void setTipoComprobante(TipoComprobante tipoComprobante) {
		this.tipoComprobante = tipoComprobante;
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
