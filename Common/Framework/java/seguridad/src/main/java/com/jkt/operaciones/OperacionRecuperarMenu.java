package com.jkt.operaciones;

import java.util.List;
import java.util.Map;

import com.jkt.dominio.menu.ElementoMenu;
import com.jkt.dominio.menu.Menu;
import com.jkt.dominio.menu.TextoMenu;
import com.jkt.transformers.Notificacion;

/**
 * Recupera el nivel de hijos inmediatos de un menu
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class OperacionRecuperarMenu extends Operation {

	private static final long FIRST_ID = 1L;

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		String oidRecibido=(String) aParams.get("oid_menu");
		Menu menu = null;
		if (oidRecibido==null || oidRecibido.isEmpty()) {
			//Consulta por el level cero
			menu = (Menu) serviceRepository.getByOid(Menu.class, FIRST_ID);
			enviarResultados(menu);
		}else{
			//Consulta por un level especifico
			int oidMenu = Integer.valueOf(oidRecibido).intValue();
			menu = (Menu) serviceRepository.getByOid(Menu.class, oidMenu);
			List<ElementoMenu> hijos = menu.getElementos();
			
			for (ElementoMenu elementoMenu : hijos) {
				enviarResultados(elementoMenu);
			}
		}
		
		
		
	}

	/**
	 * 
	 * En esta oportunidad, la operacion necesita notificar en dos diferentes tablas.
	 * La tabla 'tablas' contiene los datos del elemento de menu.
	 * La tabla 'textos' será utilizada en caso de que sea un sub menu, y el mismo contenga una cantidad de textos
	 * 
	 * @param Lista de resultados
	 */
	private void enviarResultados(ElementoMenu elementoMenu) {
		notificarObjecto(Notificacion.getNew("TMenues", elementoMenu));
		
		if (elementoMenu instanceof Menu) {
			Menu auxMenu=(Menu) elementoMenu;
			//Notificar los textos!
			long id=auxMenu.getId();
			for(TextoMenu textoMenu:auxMenu.getTextos()){
				textoMenu.setOidMenu(String.valueOf(id));
				notificarObjecto(Notificacion.getNew("TTextosMenues", textoMenu));
			}
		}
	}

}
