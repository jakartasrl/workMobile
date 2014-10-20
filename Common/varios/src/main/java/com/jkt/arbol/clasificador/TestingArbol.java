package com.jkt.arbol.clasificador;

import java.util.List;

import com.jkt.arbol.ArbolFactory;
import com.jkt.arbol.IArbol;
import com.jkt.arbol.INodo;
import com.jkt.excepcion.JakartaException;

public class TestingArbol {

	
	public static void main(String [] args) throws JakartaException{
		
		ClasificadorArbol clasificadorArbol = new ClasificadorArbol();
		
		/*
		 * Delphi adaptaer hace este trabajo
		 */
		ComponenteNodo componenteNodo = new ComponenteNodo();
		componenteNodo.setCodigoInterno(1);
		componenteNodo.setCodigoInternoPadre(0);
		
		ComponenteNodo componenteNodo2 = new ComponenteNodo();
		componenteNodo2.setCodigoInterno(2);
		componenteNodo2.setCodigoInternoPadre(0);
		
		ComponenteNodo componenteNodo3 = new ComponenteNodo();
		componenteNodo3.setCodigoInterno(3);
		componenteNodo3.setCodigoInternoPadre(1);
		
		List<INodo> hijosTransientes = clasificadorArbol.getHijosTransientes();
		hijosTransientes.add(componenteNodo);
		hijosTransientes.add(componenteNodo3);
		hijosTransientes.add(componenteNodo2);
		
		//el dev hace est trabajo.
		IArbol generarArbol = ArbolFactory.generarArbol(clasificadorArbol);
		
		
		
	}
}
