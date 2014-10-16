package com.jkt.dominio;

import com.jkt.constantes.TiposDeDato;
import com.jkt.persistencia.IServiceRepository;

/**
 * <p>Clase que será utilizada para filtrar sobre la base de datos.</p>
 * 
 * Nombre hace referencia al nombre del atributo a filtrar, este se corresponda exactamente con la variable de instancia.
 * Valor es el valor por el cual se filtrara
 * Condicion hace referencia a las diferentes condiciones, se deben extrar desde {@link IServiceRepository}
 * TipoDeDato hace referencia al tipo de dato, es necesario para filtrar genericamente en la base de datos. Se usa la clase {@link TiposDeDato}
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Filtro extends PersistentEntity {

	public Filtro() {
	}
	
	public Filtro(String nombre, String valor, String condicion,String tipoDeDato) {
		super();
		this.nombre = nombre;
		this.valor = valor;
		this.condicion = condicion;
		this.tipoDeDato = tipoDeDato;
	}

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
