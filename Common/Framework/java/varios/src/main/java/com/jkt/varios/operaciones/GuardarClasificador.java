package com.jkt.varios.operaciones;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityNotFoundException;

import com.jkt.excepcion.JakartaException;
import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.Clasificador;
import com.jkt.varios.dominio.Componente;

/**
 * Guardar una {@link Clasificador} que contiene una cadena de hijos {@link Componente}s
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class GuardarClasificador extends Operation {

	private static final String OID_FIELD = "objeto";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		Clasificador clasificador=(Clasificador) aParams.get(OID_FIELD);
		
		if (clasificador==null) {
			throw new EntityNotFoundException("No existe el clasificador buscado.");
		}
		
		/*
		 * Como primer paso, recibo una lista de componentes, y a los mismos los pongo en un mapa, usando como key su CODIGO_INTERNO,
		 * que nos servira luego para definir las relaciones de padres e hijos.
		 */
		
		List<Componente> componentes = clasificador.getComponentes();

		Map<String,Componente> mapaDesordenado=new HashMap<String, Componente>();
		for (Componente componente : componentes) {
			mapaDesordenado.put(String.valueOf(componente.getCodigoInterno()), componente);
			
			//Rompo las relaciones antiguas!!, si no las rompo puede quedar inconsistente algo, por ejemplo:
			//Desde el cliente recibo dos componentes, que ya estan en la base, si el ultimo hijo de estos componentes tenia 50 hijos mas,
			//esta relacion sigue quedando, y tendria un arbol de un solo hijo, de 52~ elementos...
			
			componente.setComponenteHijo(null);
			componente.setComponentePadre(null);
			
		}
		
		Componente primerComponente=null,componentePadre=null;
		int nivelSuperior;
		for (Componente componente : componentes) {
			nivelSuperior = componente.getCodigoInternoPadre();
			
			if (nivelSuperior==0) {
				//Si no tiene nivel superior, lo seteo como unico hijo del clasificador
				primerComponente=componente;
			}else{
				//si tiene padres, seteo la relacion padre e hijo
				componentePadre=mapaDesordenado.get(String.valueOf(nivelSuperior));
				
				if (componentePadre==null) {
					throw new JakartaException("No se encuentra el componente padre en la jerarquia.");
				}
				
				//Tengo componente y componentePadre.Establezco la relacion.
				componente.setComponentePadre(componentePadre);
				componentePadre.setComponenteHijo(componente);
				
				//Seteo el clasificador, por mas que sea de nivel N, pertenece al mismo clasificador
				componente.setClasificador(clasificador);
			}
			
		}
		
		if (primerComponente==null) {
			throw new JakartaException("El clasificador debe tener como mínimo un componente.");
		}
		
		clasificador.setComponentePadre(primerComponente);//Seteo la relacion entre clasificador y componente.Este componente a su vez tiene o no un unico hijo, y así sucesivamente.
		guardar(clasificador);
	}

}
