package com.jkt.arbol;

import java.util.List;

/**
 * Representa a la entidad que será un arbol
 * 
 * @see INodo
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public interface IArbol {

	public List<INodo> getHijosTransientes();

	public void agregarHijo(INodo hijoDePrimerNivel);

}
