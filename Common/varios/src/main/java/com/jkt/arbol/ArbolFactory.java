package com.jkt.arbol;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jkt.excepcion.JakartaException;

public class ArbolFactory {

	public static IArbol generarArbol(IArbol arbol) throws JakartaException{
		
		List<INodo> hijos = arbol.getHijosTransientes();

		Map<String,INodo> mapaDesordenado=new HashMap<String, INodo>();
		for (INodo hijo : hijos) {
			mapaDesordenado.put(String.valueOf(hijo.getCodigoInterno()), hijo);
			
			//Rompo las relaciones antiguas!!, si no las rompo puede quedar inconsistente algo, por ejemplo:
			//Desde el cliente recibo dos componentes, que ya estan en la base, si el ultimo hijo de estos componentes tenia 50 hijos mas,
			//esta relacion sigue quedando, y tendria un arbol de un solo hijo, de 52~ elementos...
			
			hijo.borrarHijos();
			hijo.setPadre(null);
			
		}
		
		INodo elementoPadre=null;
		int nivelSuperior;
		for (INodo hijo : hijos) {
			nivelSuperior = hijo.getCodigoInternoPadre();
			
			if (nivelSuperior==0) {
				//Si no tiene nivel superior, lo seteo como hijo del arbol
				arbol.agregarHijo(hijo);
			}else{
				//si tiene padres, seteo la relacion padre e hijo
				elementoPadre=mapaDesordenado.get(String.valueOf(nivelSuperior));
				
				if (elementoPadre==null) {
					throw new JakartaException("Existe una inconsistencia. No se encuentra el elemento padre en la jerarquia.");
				}
				
				//Tengo componente y componentePadre.Establezco la relacion.
				hijo.setPadre(elementoPadre);
				elementoPadre.addHijo(hijo);
				
			}
			hijo.setArbol(arbol);
			
		}
		return arbol;
	}
	
}
