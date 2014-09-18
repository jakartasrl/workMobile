package com.jkt.varios.operaciones;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityNotFoundException;

import com.jkt.excepcion.JakartaException;
import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.Componente;
import com.jkt.varios.dominio.ComponenteValor;

/**
 * <p>Operacion que recibe un componente de clasificador, y una lista en si mismo de valores de componente para dar de alta.</p>
 * <p>Se recibira una lista de valores desordenados, los cuales son ordenados respetando niveles de hijos y padres.</p><
 * <p>Posteriormente se guardan las relaciones correctas y se persisten en la base de datos.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class GuardarValoresClasificador extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		List valores = recuperarObjeto(aParams);
		Map<String, ComponenteValor> mapa=new HashMap<String, ComponenteValor>();
			
		ComponenteValor componenteValor;
		for (Object currentObject : valores) {
			componenteValor=(ComponenteValor) currentObject;
			mapa.put(String.valueOf(componenteValor.getCodigoInterno()), componenteValor);
		}
		
		//Ya tengo el mapa desordenado para poder definir las relaciones entre valores
		
		
//		ComponenteValor componenteValor;
		Componente componente;
		int codigoInternoPadre;
		ComponenteValor valorPadre;
		for (Object currentObject : valores) {
			componenteValor=(ComponenteValor) currentObject;
			
			//Defino la relacion obligatorio con un componente.No ha de existir un valor sin su componente
			componente = (Componente) obtener(Componente.class, (long)componenteValor.getIdComponente());
			componente.agregarValor(componenteValor);
			componenteValor.setComponente(componente);
			
			codigoInternoPadre = componenteValor.getCodigoInternoPadre();
			if (codigoInternoPadre>0) {
				valorPadre=mapa.get(String.valueOf(codigoInternoPadre));
				valorPadre.agregarValor(componenteValor);
			}
			guardar(componente);
			
		}
		
	}
}
