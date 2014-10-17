package com.jkt.arbol;

import java.util.List;

/**
 * Representa a la entidad que será un arbol
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public interface IArbol {

//	public List<INodo> getHijos();
	public List<INodo> getHijosTransientes();
	public void agregarHijo(INodo hijoDePrimerNivel);
	
}
