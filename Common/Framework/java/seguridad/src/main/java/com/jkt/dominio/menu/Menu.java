package com.jkt.dominio.menu;

import java.util.ArrayList;
import java.util.List;

/**
 * Un menu es un contenedor de items de menu.
 * 
 * @see ItemMenu
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Menu extends ElementoMenu {

	private int orden;
	private String rutaDeImagen;// Ruta del archivo fisico
	private String imagen;// nombre de la imagen
	private String argumento;
	/*
	 * argumento: Parametro para ofrecer comportamiento adicional a los
	 * programas o scripts. Por ejemplo, recibiendo un parametro INPUT se da de
	 * alta una entrada, cuando se recibe BAJA, se da de baja tal cosa.
	 */

	private List<ElementoMenu> elementos = new ArrayList<ElementoMenu>();
	private List<TextoMenu> textos = new ArrayList<TextoMenu>();

	public boolean agregarTexto(TextoMenu texto) {
		return this.textos.add(texto);
	}

	public void addElemento(ElementoMenu elemento) {
		elementos.add(elemento);
	}

	public int getOrden() {
		return orden;
	}

	public void setOrden(int orden) {
		this.orden = orden;
	}

	public String getRutaDeImagen() {
		return rutaDeImagen;
	}

	public void setRutaDeImagen(String rutaDeImagen) {
		this.rutaDeImagen = rutaDeImagen;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	public String getArgumento() {
		return argumento;
	}

	public void setArgumento(String argumento) {
		this.argumento = argumento;
	}

	public List<ElementoMenu> getElementos() {
		return elementos;
	}

	public void setElementos(List<ElementoMenu> elementos) {
		this.elementos = elementos;
	}

	public List<TextoMenu> getTextos() {
		return textos;
	}

	public void setTextos(List<TextoMenu> textos) {
		this.textos = textos;
	}

	@Override
	public String getTipoMenu() {
		return "SUBMENU";
	}
	
	
	
}
