package com.jkt.dominio;

import java.util.Date;

/**
 * <p>
 * Entidad persistente que hace referenca a una tabla de parametros general.
 * </p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Configuracion extends PersistentEntity {

	private String nombre;
	private String valorCadena;
	private int valorNumero=0;
	private double valorDoble=0;
	private boolean valorBooleano=false;
	private Date valorFecha;

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getValorCadena() {
		return valorCadena;
	}

	public void setValorCadena(String valorCadena) {
		this.valorCadena = valorCadena;
	}

	public int getValorNumero() {
		return valorNumero;
	}

	public void setValorNumero(int valorNumero) {
		this.valorNumero = valorNumero;
	}

	public double getValorDoble() {
		return valorDoble;
	}

	public void setValorDoble(double valorDoble) {
		this.valorDoble = valorDoble;
	}

	public boolean isValorBooleano() {
		return valorBooleano;
	}

	public void setValorBooleano(boolean valorBooleano) {
		this.valorBooleano = valorBooleano;
	}

	public Date getValorFecha() {
		return valorFecha;
	}

	public void setValorFecha(Date valorFecha) {
		this.valorFecha = valorFecha;
	}

}
