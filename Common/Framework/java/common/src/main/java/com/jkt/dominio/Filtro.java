package com.jkt.dominio;

public class Filtro extends PersistentEntity {

	private String nombre, valor, condicion, tipoDeDato;

	public String getTipoDeDato() {
		return tipoDeDato;
	}

	public void setTipoDeDato(String tipoDeDato) {
		this.tipoDeDato = tipoDeDato;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public String getCondicion() {
		return condicion;
	}

	public void setCondicion(String condicion) {
		this.condicion = condicion;
	}

}
