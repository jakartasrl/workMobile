package com.jkt.operaciones;

import java.io.InputStream;
import java.util.Collection;
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
 * En cada request, se leera un archivo XML y se intentará persistir el mismo, recorriendo la estructura correspondiente
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class CrearMenues extends Operation {

	
	private static final String CODIGO_MENU = "codigoMenu".toUpperCase();
	private static final String FILE_NAME = "fileName".toUpperCase();

	public void execute(Map<String, Object> aParams) throws Exception {
		String fileName = (String) aParams.get(FILE_NAME);
		String codigo = (String) aParams.get(CODIGO_MENU);
		
		Digester digester = generarReglas();
		InputStream in = this.getClass().getResourceAsStream(fileName);
		MenuContainerXML menues = (MenuContainerXML) digester.parse(in);
		
		MenuXML menuXML = menues.getMenues().get(codigo);
		Menu menu = (Menu) parsearRespuestaDesdeElXML(menuXML);
		
		this.serviceRepository.save(menu);
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
			
			digester.addObjectCreate("menues/"+value+"/texto", TextoXML.class.getName());
			digester.addSetProperties("menues/"+value+"/texto");
			digester.addSetNext("menues/"+value+"/texto", "agregarTexto", TextoXML.class.getName());
		
			value+="/elemento";
		}

		return digester;
	}
	
	private ElementoMenu parsearRespuestaDesdeElXML(MenuXML menu) throws JakartaException{
		
		ElementoMenu elementoActual = null;
		String tipo = menu.getTipo();
		if ("MENU".equals(tipo)) {
			Menu m=new Menu();
			completarCampos(menu, m);
			m.setArgumento(menu.getArgumento());
			m.setImagen(menu.getImagen());
			m.setRutaDeImagen(menu.getRutaImagen());

			List<TextoXML> textos = menu.getTextos();
			TextoMenu textoMenu =null;
			for (TextoXML textoXML : textos) {
				textoMenu = new TextoMenu();
				textoMenu.setTamanio(Integer.valueOf(textoXML.getTamanio()).intValue());
				textoMenu.setFuente(textoXML.getFuente());
				textoMenu.setTexto(textoXML.getTexto());
				textoMenu.setAlineacion(textoXML.getAlineacion());
				m.agregarTexto(textoMenu);
			}
			
			Collection<MenuXML> values = menu.getHijos().values();
			for (MenuXML menuXML : values) {
				m.addElemento(parsearRespuestaDesdeElXML(menuXML));
			}
			return m;
		}else if ("PROGRAMA".equals(tipo)) {
			elementoActual=new Programa();
			completarCampos(menu, elementoActual);
		}else if ("SCRIPT".equals(tipo)) {
			elementoActual=new Script();
			completarCampos(menu, elementoActual);
		}else{
			throw new JakartaException("Error al intentar reconocer el tipo de elemento del menu.");
		}
		
		return elementoActual;
	}

	private void completarCampos(MenuXML source, ElementoMenu target){
		target.setCodigo(source.getCodigo());
		target.setDescripcion(source.getDescripcion());
	}
	
}
