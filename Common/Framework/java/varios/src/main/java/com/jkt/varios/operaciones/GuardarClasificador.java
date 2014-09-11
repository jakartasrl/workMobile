package com.jkt.varios.operaciones;

import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.persistence.EntityNotFoundException;

import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.Clasificador;
import com.jkt.varios.dominio.Componente;

/**
 * Guardar una {@link Clasificador} que contiene una cadena de hijos {@link Componente}s
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class GuardarClasificador extends Operation {

	private static final String OID_FIELD = "OID";

	@SuppressWarnings("unchecked")
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
//		List objetoRecuperado = recuperarObjeto(aParams);
		Clasificador clasificador=(Clasificador) aParams.get(OID_FIELD);
		
		if (clasificador==null) {
			throw new EntityNotFoundException("No existe el clasificador buscado.");
		}
		
		List<Componente> componentes = clasificador.getComponentes();

		Map<String,Componente> mapaDesordenado=new HashMap<String, Componente>();
		for (Componente componente : componentes) {
			mapaDesordenado.put(String.valueOf(componente.getNivel()), componente);
		}
		
		Entry<String, Componente> entry;
		for(Iterator<Entry<String, Componente>> iterator = mapaDesordenado.entrySet().iterator(); iterator.hasNext();){
			entry = (Entry<String, Componente>) iterator.next();
			
		}
		
		
		/*
		Clasificador clasificador=(Clasificador) objetoRecuperado.get(0);

		List<Componente> componentes = clasificador.getComponentes();
		
		if (componentes!= null && !componentes.isEmpty()) {
			
			Collections.sort(componentes, new Comparator() {
				Componente v1,v2;
				public int compare(Object o1, Object o2) {
					v1=(Componente) o1;
					v2=(Componente) o2;
					return new Integer(v1.getNivel()).compareTo(new Integer(v2.getNivel()));
				}
			});
			
			//Llega la lista ordenada.Lo que resta es ir agregando en la lista ordenada los elementos.
			Componente primerComponente = componentes.get(0);
			clasificador.setComponentePadre(primerComponente);
			primerComponente.setClasificador(clasificador);
	
			Componente componenteAux=primerComponente;
			Componente siguienteComponente;
			for (int i = 1; i < componentes.size(); i++) {
				siguienteComponente=componentes.get(i);
				
				componenteAux.setComponenteHijo(siguienteComponente);
				siguienteComponente.setComponentePadre(componenteAux);
				
				componenteAux=siguienteComponente;
			}
	
			//Una vez armado todo el clasificador, lo persisto.
			serviceRepository.save(clasificador);
		}
		
		*/
	}

}
