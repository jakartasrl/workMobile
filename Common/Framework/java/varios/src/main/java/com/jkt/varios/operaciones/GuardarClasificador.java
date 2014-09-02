package com.jkt.varios.operaciones;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.Clasificador;
import com.jkt.varios.dominio.Componente;

/**
 * Guardar una {@link Clasificador} que contiene una cadena de hijos {@link Componente}s
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class GuardarClasificador extends Operation {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		List objetoRecuperado = recuperarObjeto(aParams);
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
		
		
	}

}
