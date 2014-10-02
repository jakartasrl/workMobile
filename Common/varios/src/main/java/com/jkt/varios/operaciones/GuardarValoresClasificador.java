package com.jkt.varios.operaciones;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.Clasificador;
import com.jkt.varios.dominio.Componente;
import com.jkt.varios.dominio.ComponenteValor;

/**
 * <p>Operacion que recibe una lista en si mismo de valores de componente para dar de alta.</p>
 * <p>Se recibira una lista de valores desordenados, los cuales son ordenados respetando niveles de hijos y padres.</p>
 * <p>Posteriormente se guardan las relaciones correctas y se persisten en la base de datos.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class GuardarValoresClasificador extends Operation {

	@Override
	@SuppressWarnings("rawtypes")
	public void execute(Map<String, Object> aParams) throws Exception {
		List valores = recuperarObjeto(aParams);
 		Map<String, ComponenteValor> mapa=new HashMap<String, ComponenteValor>();
		Map<String, Componente> mapaComponentes=new HashMap<String, Componente>();
			
		ComponenteValor componenteValor;
		Componente componente;
		String idDeComponente;
		
		//Para cada valor recibido, inserto una unidad en una mapa
		//Si los valores comparten 5 veces un componente, solamente se guarda una vez este componente en el mapa de componentes.
		for (Object currentObject : valores) {
			componenteValor=(ComponenteValor) currentObject;
			mapa.put(String.valueOf(componenteValor.getCodigoInterno()), componenteValor);
			
			idDeComponente = String.valueOf(componenteValor.getIdComponente());
			
			if(!mapaComponentes.containsKey(idDeComponente)){
				componente=(Componente) obtener(Componente.class, (long)componenteValor.getIdComponente());
				if (componente!=null) {
					mapaComponentes.put(idDeComponente, componente);
				}
			}
		}
		
		//Ya tengo el mapa desordenado para poder definir las relaciones entre valores
		int codigoInternoPadre;
		ComponenteValor valorPadre;
		for (Object currentObject : valores) {
			componenteValor=(ComponenteValor) currentObject;
			
			//Defino la relacion obligatorio con un componente.No ha de existir un valor sin su componente
			componente = mapaComponentes.get(String.valueOf(componenteValor.getIdComponente()));
			
			componente.agregarValor(componenteValor);
			componenteValor.setComponente(componente);
			
			codigoInternoPadre = componenteValor.getCodigoInternoPadre();
			if (codigoInternoPadre!=0) {
				valorPadre=mapa.get(String.valueOf(codigoInternoPadre));
				valorPadre.agregarValor(componenteValor);
			}
			
		}
		
		//Por cuestion de hibernate, solamente guardo una vez al clasificador que contiene todos los componentes
		//y los valores, en vez de guardar N vecespor cada valor.
		Collection<Componente> values = mapaComponentes.values();
		for (Componente componenteListo : values) {
			Clasificador c=componenteListo.getClasificador();
			guardar(c);
			break;
		}
		
	}
}
