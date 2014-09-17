package com.jkt.dominio.menu;

import com.jkt.dominio.PersistentEntity;

/**
 * Un texto de menu representa un simple texto con formato, es decir, un texto,
 * la forma de posicionamiento, el tamaño y la fuente.
 * 
 * TODO definir estandares con el equipo de delphi y html
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TextoMenu extends PersistentEntity {

	private String texto;
	private String alineacion;
	private String fuente;
	private int tamanio;

	// Transient campo, para enviar como referencia a la salida.
	private String oidMenu;

	public String getOidMenu() {
		return oidMenu;
	}

	public void setOidMenu(String oidMenu) {
		this.oidMenu = oidMenu;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}

	public String getAlineacion() {
		return alineacion;
	}

	public void setAlineacion(String alineacion) {
		this.alineacion = alineacion;
	}

	public String getFuente() {
		return fuente;
	}

	public void setFuente(String fuente) {
		this.fuente = fuente;
	}

	public int getTamanio() {
		return tamanio;
	}

	public void setTamanio(int tamanio) {
		this.tamanio = tamanio;
	}

}
