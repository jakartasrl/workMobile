package com.jkt.dominio.menu;

import com.jkt.dominio.PersistentEntity;

/**
 * De aqui se desprende lo que puede ser un menu,un item de menu, un programa o
 * un script
 * 
 * @see Menu
 * @see ItemMenu
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public abstract class ElementoMenu extends PersistentEntity {

	private String codigo;
	private String descripcion;

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

}
