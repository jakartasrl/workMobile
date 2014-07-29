package com.jkt.dominio.menu.xml;

import java.util.HashMap;
import java.util.Map;

/**
 * Contenedor de todos los menues para recuperarlo posteriormente con el codigo.
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class MenuContainerXML {

	private Map<String, MenuXML> menues=new HashMap<String, MenuXML>();

	public Map<String, MenuXML> getMenues() {
		return menues;
	}

	public void setMenues(Map<String, MenuXML> menues) {
		this.menues = menues;
	}
	
	public void agregarMenu(MenuXML menu){
		menues.put(menu.getCodigo(), menu);
	}
	
}
