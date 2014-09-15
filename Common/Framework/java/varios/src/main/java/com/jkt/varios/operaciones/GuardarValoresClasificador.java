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

	private static final String KEY_PARA_RECUPERAR_OBJETO = "objeto";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		
		/*
		 * TODO MODIFICAR LA TABLA DE ENTRADA, SE RECIBE SOLAMENTE UNA SOLA TABLA, QUE CONTIENE EL ID DEL COMPONENTE.
		 * PARA CADA VALOR IRE A BUSCAR EL COMPONENTE, Y NO MUCHO MAS.
		 * 
		 */
		
		
		
		
		Componente componente=(Componente) aParams.get(KEY_PARA_RECUPERAR_OBJETO);
		
		if (componente==null) {
			throw new EntityNotFoundException("No existe el componente buscado.");
		}
		
		
		List<ComponenteValor> valoresEnLista = componente.getValores();
		Map<String,ComponenteValor> mapaDesordenado=new HashMap<String, ComponenteValor>();

		for (ComponenteValor componenteValor : valoresEnLista) {
			mapaDesordenado.put(String.valueOf(componente.getCodigoInterno()), componenteValor);
			
			//Rompo las relaciones antiguas!!, si no las rompo puede quedar inconsistente algo, por ejemplo:
			//Desde el cliente recibo dos componentes, que ya estan en la base, si el ultimo hijo de estos componentes tenia 50 hijos mas,
			//esta relacion sigue quedando, y tendria un arbol de un solo hijo, de 52~ elementos...
			
			//MISMO EJEMPLO PARA CLASIFICADOR-COMPONENTES QUE PARA COMPONENTE-VALORES
			
			componenteValor.setComponenteValorPadre(null);
			componenteValor.getValores().clear();
		}
		
		int nivelSuperior;
		ComponenteValor  componenteValorPadre=null;

		for (ComponenteValor componenteValor : valoresEnLista) {
			nivelSuperior = componenteValor.getCodigoInternoPadre();
			
			//Si el nivel es cero, es un valor del componente, y no de otro valor
			if (nivelSuperior==0) {
				componente.agregarValor(componenteValor);
			}else{
				componenteValorPadre=mapaDesordenado.get(String.valueOf(nivelSuperior));
				//No creo que haga falta validacion para saber si es no nulo el padre. Suponemos aquí que la información desde el cliente es consistente
				componenteValorPadre.agregarValor(componenteValor);
				componenteValor.setComponenteValorPadre(componenteValorPadre);
			}
		}
		
		if(componente.getValores().isEmpty()){
			throw new JakartaException("No ha configurado ningun valor para el componente.Se cancela el salvado de valores de clasificador.");
		}

		guardar(componente);	
	}

}
