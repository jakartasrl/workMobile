package com.jkt.operaciones;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.jkt.dominio.menu.ElementoMenu;
import com.jkt.dominio.menu.Menu;
import com.jkt.dominio.menu.TextoMenu;
import com.jkt.excepcion.JakartaException;

/**
 * Recupera el nivel de hijos inmediatos de un menu
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class RecuperarMenu extends Operation {

	private static final String CAMPO_OID_MENU = "oid_menu".toUpperCase();

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		String oidRecibido=(String) aParams.get(CAMPO_OID_MENU);
		Menu menu = null;
		if (oidRecibido==null || oidRecibido.isEmpty()) {
			Query hql = crearHQL("from Menu m where m.type = :type");
			hql.setParameter("type", Menu.MENU_PRINCIPAL);
			notificarObjeto("",	hql.list());
		}else{
			int oidMenu = Integer.valueOf(oidRecibido).intValue();
			menu = (Menu) obtener(Menu.class, oidMenu);
			notificarObjeto("", menu.getElementos());
		}
		
//		enviarResultados(menu, NOMBRE_TABLA_CABECERA);
//		
//		List<ElementoMenu> hijos = menu.getElementos();
//		
//		for (ElementoMenu elementoMenu : hijos) {
//			enviarResultados(elementoMenu,NOMBRE_TABLA_MENUES);
//		}
		
	}

//	/**
//	 * 
//	 * En esta oportunidad, la operacion necesita notificar en dos diferentes tablas.
//	 * La tabla 'tablas' contiene los datos del elemento de menu.
//	 * La tabla 'textos' ser� utilizada en caso de que sea un sub menu, y el mismo contenga una cantidad de textos
//	 * 
//	 * @param Lista de resultados
//	 */
//	private void enviarResultados(ElementoMenu elementoMenu, String nombreDeLaTablaDeSalida) {
//		notificarObjeto(nombreDeLaTablaDeSalida, elementoMenu);
		
//		if (elementoMenu instanceof Menu) {
//			Menu auxMenu=(Menu) elementoMenu;
			//Notificar los textos!
//			long id=auxMenu.getId();
//			for(TextoMenu textoMenu:auxMenu.getTextos()){
//				textoMenu.setOidMenu(String.valueOf(id));
//				notificarObjeto(NOMBRE_TABLA_TEXTOS, textoMenu);
//			}
//		}
//	}

}
