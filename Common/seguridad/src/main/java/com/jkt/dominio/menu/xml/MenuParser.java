package com.jkt.dominio.menu.xml;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.digester3.Digester;
import org.xml.sax.SAXException;

import com.jkt.dominio.menu.Menu;
import com.jkt.request.EventBusiness;
import com.jkt.xmlreader.XMLCampo;
import com.jkt.xmlreader.XMLEntity;

/**
 * Clase encargada de parsear el contenido de un archivo XML que representa a los menues en entidades
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class MenuParser {

	public Menu parseFile(String xmlFilePath) throws IOException, SAXException{
		Digester digester = generarReglas();
//		InputStream inputStream = servletContext.getResourceAsStream("/WEB-INF/operaciones.xml");
		InputStream inputStream=null;//new File(xmlFilePath) ;//leer desde donde corresponda
		return (Menu) digester.parse(inputStream);
	}
	
	private Digester generarReglas(){
		Digester digester = new Digester();
		digester.setValidating(false);
		
		digester.addObjectCreate("menu", Menu.class.getName());
		
		digester.addObjectCreate("entity/operacion", EventBusiness.class.getName());

		digester.addSetProperties("entity/operacion");
		digester.addSetNext("entity/operacion", "addHijo", EventBusiness.class.getName());
		
		digester.addObjectCreate("entity/operacion/dataset", XMLEntity.class.getName());
		digester.addSetProperties("entity/operacion/dataset");
		digester.addSetNext("entity/operacion/dataset", "addHijo", XMLEntity.class.getName());

		digester.addObjectCreate("entity/operacion/dataset/campo", XMLCampo.class.getName());
		digester.addSetProperties("entity/operacion/dataset/campo");
		digester.addSetNext("entity/operacion/dataset/campo", "addHijo", XMLCampo.class.getName());

		digester.addObjectCreate("entity/operacion/tables", XMLEntity.class.getName());
		digester.addSetProperties("entity/operacion/tables");
		digester.addSetNext("entity/operacion/tables", "addHijo", XMLEntity.class.getName());

		return digester;
	}
	
}
