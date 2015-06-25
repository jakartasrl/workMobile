package com.jkt.operaciones;

import java.io.InputStream;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.digester3.Digester;

import com.jkt.dominio.PersistentEntity;
import com.jkt.dominio.menu.ElementoMenu;
import com.jkt.dominio.menu.Menu;
import com.jkt.dominio.menu.Programa;
import com.jkt.dominio.menu.Script;
import com.jkt.dominio.menu.TextoMenu;
import com.jkt.dominio.menu.xml.MenuContainerXML;
import com.jkt.dominio.menu.xml.MenuXML;
import com.jkt.dominio.menu.xml.TextoXML;
import com.jkt.excepcion.JakartaException;

/**
 * Operacion que recupera un menu usando el codigo correspondiente.
 * En cada request, se leera un archivo XML y se intentar� persistir el mismo, recorriendo la estructura correspondiente
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class CrearMenues extends Operation {

	
	private static final String MENU_TYPE = "MENU";
	private static final String SCRIPT = "SCRIPT";
	private static final String PROGRAMA = "PROGRAMA";
	private static final String CODIGO_MENU = "codigoMenu".toUpperCase();
	private static final String FILE_NAME = "fileName".toUpperCase();

	public void execute(Map<String, Object> aParams) throws Exception {
		String fileName = (String) aParams.get(FILE_NAME);
		String codigo = (String) aParams.get(CODIGO_MENU);
		
		Digester digester = generarReglas();
		InputStream in = this.getClass().getResourceAsStream(fileName);
		MenuContainerXML menues = (MenuContainerXML) digester.parse(in);
		
//		MenuXML menuXML = menues.getMenues().get(codigo);
		
		Collection<MenuXML> values = menues.getMenues().values();
		for (MenuXML menuXML2 : values) {
			Menu menu = (Menu) parsearRespuestaDesdeElXML(menuXML2);
			this.serviceRepository.save(menu);
		}
//		
	}
	
	private Digester generarReglas(){
		
		Digester digester = new Digester();
		digester.setValidating(false);
		
		digester.addObjectCreate("menues", MenuContainerXML.class.getName());
		
		digester.addObjectCreate("menues/elemento", MenuXML.class.getName());
		digester.addSetProperties("menues/elemento");
		digester.addSetNext("menues/elemento", "agregarMenu", MenuXML.class.getName());

		/*
		 * Solucion poco elegante para cubrir varios niveles de tags anidados
		 */
		String value="elemento";
		for (int i = 0; i < 5; i++) {
			
			digester.addObjectCreate("menues/"+value+"/elemento", MenuXML.class.getName());
			digester.addSetProperties("menues/"+value+"/elemento");
			digester.addSetNext("menues/"+value+"/elemento", "agregarHijo", MenuXML.class.getName());
			
//			digester.addObjectCreate("menues/"+value+"/texto", TextoXML.class.getName());
//			digester.addSetProperties("menues/"+value+"/texto");
//			digester.addSetNext("menues/"+value+"/texto", "agregarTexto", TextoXML.class.getName());
		
			value+="/elemento";
		}

		return digester;
	}
	
	private ElementoMenu parsearRespuestaDesdeElXML(MenuXML menu) throws JakartaException{
		
		Menu m=  new Menu();
		m.setCodigo(menu.getCodigo());
		m.setImg(menu.getImg());
		m.setLink(menu.getLink());
		m.setSize(menu.getSize());
		m.setType(menu.getType());
		m.setTheme(menu.getTheme());
		
		Collection<MenuXML> values = menu.getHijos().values();
		for (MenuXML menuXML : values) {
			m.getElementos().add(parsearRespuestaDesdeElXML(menuXML));
		}
		return m;
		
	}
	
}
