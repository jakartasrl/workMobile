package com.jkt.dominio.menu.xml;

import java.util.ArrayList;
import java.util.List;

/**
 * Entidad que representa lo mapeado desde un XML con digester.
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class MenuXML {

	private String codigo,descripcion;
	
	private List<ElementoXML> elementos=new ArrayList<ElementoXML>();
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
	public List<ElementoXML> getElementos() {
		return elementos;
	}
	public void setElementos(List<ElementoXML> elementos) {
		this.elementos = elementos;
	}
	
	public void addElemento(ElementoXML elemento){
		this.elementos.add(elemento);
	}
	
}
