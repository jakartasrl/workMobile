package com.jkt.dominio.menu;

import lombok.Data;

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
@Data
public abstract class ElementoMenu extends PersistentEntity {

	private String codigo;
	private String descripcion;
	private String tipoMenu;

	abstract public String getTipoMenu();

}
