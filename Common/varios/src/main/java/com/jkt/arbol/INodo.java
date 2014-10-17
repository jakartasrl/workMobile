package com.jkt.arbol;

/**
 * Representa a cada elemento del {@link IArbol}
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public interface INodo {

	public int getCodigoInterno();
	public int getCodigoInternoPadre();
	
	public void setArbol(IArbol arbol);
	
	public void setPadre(INodo padre);
	public void borrarHijos();
	public void addHijo(INodo hijo);
	
}
