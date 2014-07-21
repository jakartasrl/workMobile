package com.jkt.dominio.menu.xml;

/**
 * Representa una entidad recuperada desde el digester
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class TextoXML {

	private String texto, alineacion, fuente, tamanio;

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

	public String getTamanio() {
		return tamanio;
	}

	public void setTamanio(String tamanio) {
		this.tamanio = tamanio;
	}

}
