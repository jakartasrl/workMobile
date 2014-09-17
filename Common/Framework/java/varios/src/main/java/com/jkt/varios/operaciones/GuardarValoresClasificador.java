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
		
		ComponenteValor componenteValor;
		Componente componente;
		for (Object currentObject : valores) {
			componenteValor=(ComponenteValor) currentObject;
			
			componente = (Componente) obtener(Componente.class, (long)componenteValor.getIdComponente());
			componente.agregarValor(componenteValor);
			componenteValor.setComponente(componente);
			
			guardar(componente);
			
		}
		
	}
}
