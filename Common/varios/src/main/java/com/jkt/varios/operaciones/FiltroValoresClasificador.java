package com.jkt.varios.operaciones;

import java.util.List;
import java.util.Map;

import com.jkt.excepcion.JakartaException;
import com.jkt.operaciones.Operation;
import com.jkt.transformers.Notificacion;
import com.jkt.varios.dominio.Clasificador;
import com.jkt.varios.dominio.Componente;
import com.jkt.varios.dominio.ComponenteValor;

public class FiltroValoresClasificador extends Operation {

	private static final String OID = "oidentidadmaestra".toUpperCase();

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		validarEntrada(aParams.get(OID));
		
		//Obtengo el clasificador desde la base
		Clasificador clasificador= (Clasificador) obtener(Clasificador.class, (String)aParams.get(OID));
		
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
			notificarObjecto(Notificacion.getNew("resultado", componenteValor));
		}
	}

}
