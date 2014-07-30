package com.jkt.operaciones;

import java.util.List;
import java.util.Map;

import com.jkt.dominio.menu.ElementoMenu;
import com.jkt.dominio.menu.Menu;
import com.jkt.dominio.menu.TextoMenu;
import com.jkt.excepcion.JakartaException;
import com.jkt.transformers.Notificacion;

/**
 * Recupera el nivel de hijos inmediatos de un menu
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class RecuperarMenu extends Operation {

	private static final String CAMPO_OID_MENU = "oid_menu";
	private static final String NOMBRE_TABLA_TEXTOS = "TTextosMenues";
	private static final String NOMBRE_TABLA_MENUES = "TMenues";
	private static final String NOMBRE_TABLA_CABECERA = "TCabecera";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		String oidRecibido=(String) aParams.get(CAMPO_OID_MENU);
		Menu menu = null;
		if (oidRecibido==null || oidRecibido.isEmpty()) {
			throw new JakartaException("Debe ingresar el parametro oid_menu.");
		}

		int oidMenu = Integer.valueOf(oidRecibido).intValue();
		menu = (Menu) serviceRepository.getByOid(Menu.class, oidMenu);
		
		enviarResultados(menu, NOMBRE_TABLA_CABECERA);
		
		List<ElementoMenu> hijos = menu.getElementos();
		
		for (ElementoMenu elementoMenu : hijos) {
			enviarResultados(elementoMenu,NOMBRE_TABLA_MENUES);
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
	private void enviarResultados(ElementoMenu elementoMenu, String nombreDeLaTablaDeSalida) {
		notificarObjecto(Notificacion.getNew(nombreDeLaTablaDeSalida, elementoMenu));
		
		if (elementoMenu instanceof Menu) {
			Menu auxMenu=(Menu) elementoMenu;
			//Notificar los textos!
			long id=auxMenu.getId();
			for(TextoMenu textoMenu:auxMenu.getTextos()){
				textoMenu.setOidMenu(String.valueOf(id));
				notificarObjecto(Notificacion.getNew(NOMBRE_TABLA_TEXTOS, textoMenu));
			}
		}
	}

}
