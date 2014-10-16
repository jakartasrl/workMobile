package com.jkt.varios.operaciones;

import java.util.List;
import java.util.Map;

import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.Clasificador;
import com.jkt.varios.dominio.Componente;
import com.jkt.varios.dominio.ComponenteValor;

/**
 * <p>Retorna una lista de valores de clasificador, pero mostrando solamente los mismos del componente del ultimo nivel.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class FiltroValoresClasificador extends Operation {

	private static final String OID_CLASIFICADOR = "oidentidadmaestra".toUpperCase();

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		validarEntrada(aParams.get(OID_CLASIFICADOR));
		
		//Obtengo el clasificador desde la base
		Clasificador clasificador= (Clasificador) obtener(Clasificador.class, (String)aParams.get(OID_CLASIFICADOR));
		
		//Si el clasificador no tiene componentes se termina la rutina
		Componente componentePadre = clasificador.getComponentePadre();
		if (componentePadre==null) {
			return;
		}
		
		//Si el componente no tiene hijos, es hoja, y muestro sus datos
		if (componentePadre.getComponenteHijo()==null) {
			mostrarValores(componentePadre);
		}else{
			//de modo contrario, recorro la lista de hijos hasta encontrar al componente hoja, y muestro sus valores.
			Componente componenteActual=componentePadre;
			while(componenteActual.getComponenteHijo()!=null){
				componenteActual=componenteActual.getComponenteHijo();
			}
			mostrarValores(componenteActual);
		}
	}

	/**
	 * Muestra todos los valores de un componente hoja.
	 */
	private void mostrarValores(Componente componentePadre) {
		List<ComponenteValor> valores = componentePadre.getValores();
		for (ComponenteValor componenteValor : valores) {
			if (componenteValor==null) {
				continue;
			}
			notificarObjeto("resultado", componenteValor);
		}
	}

}
