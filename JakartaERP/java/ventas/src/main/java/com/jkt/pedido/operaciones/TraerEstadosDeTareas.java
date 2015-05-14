package com.jkt.pedido.operaciones;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.Container;
import com.jkt.grafo.DatoNodo;
import com.jkt.grafo.DatoNodo.Estado;
import com.jkt.operaciones.Operation;

/**
 * Retorna una lista con todos los estados disponibles.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerEstadosDeTareas extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		List<Container> contenedores= new ArrayList<Container>();
		Estado[] values = DatoNodo.Estado.values();
		for (Estado estado : values) {
			Container container = new Container();
			container.setCodigo(String.valueOf(estado.getValue()));
			container.setDescripcion(estado.getDescripcion());
			contenedores.add(container);
		}
		
		notificarObjeto("", contenedores);
	}

}
