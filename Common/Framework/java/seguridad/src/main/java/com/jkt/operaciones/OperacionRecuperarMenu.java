package com.jkt.operaciones;

import java.util.List;
import java.util.Map;

import com.jkt.dominio.menu.ElementoMenu;
import com.jkt.dominio.menu.Menu;
import com.jkt.transformers.Notificacion;

/**
 * Recupera el nivel de hijos inmediatos de un menu
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class OperacionRecuperarMenu extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		int oidMenu = Integer.valueOf((String)aParams.get("oid_menu")).intValue();
		Menu menu = (Menu) serviceRepository.getByOid(Menu.class, oidMenu);
		List<ElementoMenu> hijos = menu.getElementos();
		
		for (ElementoMenu elementoMenu : hijos) {
			notificarObjecto(Notificacion.getNew("resultado", elementoMenu));
		}
		
	}

}
