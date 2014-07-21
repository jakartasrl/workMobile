package com.jkt.dominio.menu.xml;

import java.util.ArrayList;
import java.util.List;

/**
 * Entidad que representa lo mapeado desde un XML con digester.
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class ElementoXML extends MenuXML{

	private String tipo;
	private int orden;
	private String imagen;
	private String rutaImagen;
	private String argumento;
	private List<TextoXML> textos=new ArrayList<TextoXML>();
	
	
}
