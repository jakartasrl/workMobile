package com.jkt.dominio.menu;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

/**
 * Un menu es un contenedor de items de menu.
 * 
 * @see ItemMenu
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class Menu extends ElementoMenu {

	public static final String MENU = "menu";
	public static final String MENU_PRINCIPAL = "menu_principal";
	public static final String SUBMENU = "submenu";

	private String name;
	private String img;
	private String size;
	private String theme;
	private String link;
	private String type;
	private String orden;
	
	private String vm;
	
	private List<ElementoMenu> elementos = new ArrayList<ElementoMenu>();

	@Override
	public String getTipoMenu() {
		return "SUBMENU";
	}
	
}
