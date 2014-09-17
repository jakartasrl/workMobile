package com.jkt.dominio.menu.xml;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Entidad que representa lo mapeado desde un XML con digester.
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class MenuXML {

	private String codigo,descripcion;
	private Map<String,MenuXML> hijos=new HashMap<String,MenuXML>();//Representa a los hijos
	private String tipo;
	private int orden;
	private String imagen;
	private String rutaImagen;
	private String argumento;
	private List<TextoXML> textos=new ArrayList<TextoXML>();

	public void agregarHijo(MenuXML elemento){
		this.hijos.put(elemento.getCodigo(), elemento);
	}
	
	/**
	 * 
	 * Agrega un texto 
	 * @param t
	 */
	public void agregarTexto(TextoXML t){
		if (textos.size()<4) {
			this.textos.add(t);
		}
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Map<String, MenuXML> getHijos() {
		return hijos;
	}

	public void setHijos(Map<String, MenuXML> hijos) {
		this.hijos = hijos;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public int getOrden() {
		return orden;
	}

	public void setOrden(int orden) {
		this.orden = orden;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	public String getRutaImagen() {
		return rutaImagen;
	}

	public void setRutaImagen(String rutaImagen) {
		this.rutaImagen = rutaImagen;
	}

	public String getArgumento() {
		return argumento;
	}

	public void setArgumento(String argumento) {
		this.argumento = argumento;
	}

	public List<TextoXML> getTextos() {
		return textos;
	}

	public void setTextos(List<TextoXML> textos) {
		this.textos = textos;
	}
	
	
}
