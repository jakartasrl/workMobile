package com.jkt.operaciones;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import org.apache.commons.digester3.Digester;
import org.hibernate.Query;

import com.jkt.dominio.menu.ElementoMenu;
import com.jkt.dominio.menu.Menu;
import com.jkt.dominio.menu.xml.MenuContainerXML;
import com.jkt.dominio.menu.xml.MenuXML;
import com.jkt.excepcion.JakartaException;

/**
 * Operacion que recupera un menu usando el codigo correspondiente.
 * En cada request, se leera un archivo XML y se intentar� persistir el mismo, recorriendo la estructura correspondiente
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class CrearMenues extends Operation {

	
//	private static final String MENU_TYPE = "MENU";
//	private static final String SCRIPT = "SCRIPT";
//	private static final String PROGRAMA = "PROGRAMA";
//	private static final String CODIGO_MENU = "codigoMenu".toUpperCase();
	private static final String FILE_NAME = "fileName".toUpperCase();

	private int version;
	
	public void execute(Map<String, Object> aParams) throws Exception {
		String fileName = (String) aParams.get(FILE_NAME);
//		String codigo = (String) aParams.get(CODIGO_MENU);
		
		int executeUpdate;
		try{
			Query obtenerMaximaVersion = crearHQL("Select max(version) from Menu");
			executeUpdate = (Integer) obtenerMaximaVersion.uniqueResult();
		}catch(Exception e){
			executeUpdate = 0;
		}
		
		this.version=executeUpdate+1;
		
		Digester digester = generarReglas();
		InputStream in = this.getClass().getResourceAsStream(fileName);
		MenuContainerXML menues = (MenuContainerXML) digester.parse(in);
		
//		Collection<MenuXML> values = menues.getMenues().values();
		
		List<MenuXML> values = new ArrayList<MenuXML>();
		values.addAll(menues.getMenues().values());
//				Arrays.asList(menues.getMenues().values());
		//ordenar esta lista!!
		Collections.sort(values, new Comparator() {

			public int compare(Object arg0, Object arg1) {
				MenuXML m1=(MenuXML) arg0;
				MenuXML m2=(MenuXML) arg1;
				return m1.getOrden().compareTo(m2.getOrden());
//				return new Integer(m1.getOrden()).compareTo(new Integer(m2.getOrden()));
			}
		});
		
		
		for (MenuXML menuXML2 : values) {
			Menu menu = (Menu) parsearRespuestaDesdeElXML(menuXML2);
			this.serviceRepository.save(menu);
		}
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
		
		m.setVersion(this.version);

		m.setName(menu.getName());
		m.setCodigo(menu.getCodigo());
		m.setImg(menu.getImg());
		m.setLink(menu.getLink());
		m.setSize(menu.getSize());
		m.setType(menu.getType());
		m.setTheme(menu.getTheme());
		m.setOrden(menu.getOrden());
		
		m.setVm(menu.getVm());

		Collection<MenuXML> values = menu.getHijos().values();
		for (MenuXML menuXML : values) {
			m.getElementos().add(parsearRespuestaDesdeElXML(menuXML));
		}
		return m;
		
	}
	
}
