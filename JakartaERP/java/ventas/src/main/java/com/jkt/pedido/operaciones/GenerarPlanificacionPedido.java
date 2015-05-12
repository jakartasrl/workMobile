package com.jkt.pedido.operaciones;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.Data;

import com.jkt.dominio.Descriptible;
import com.jkt.grafo.PlanificacionPedido;
import com.jkt.grafo.TareaPedido;
import com.jkt.operaciones.Operation;
import com.jkt.pedido.dominio.Pedido;

/**
 * A partir de N tareas, esta operacion las guarda en un mapa, y genera el grafo de tareas.
 * 
 * EL problema, que surge para generar esta operación es que en un principio todas las tareas estan en memoria, y no puedo
 * referenciar 2 veces a la misma tarea.
 * 
 * Si la tarea A tiene precedente a la tarea Z, y la tarea B como precedente a la tarea Z, es como que se generan 4 tareas.
 * A->z1
 * B->z2
 * 
 * Por eso genero N tareas, las persisto, y luego genero el grafo con las precedencias.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class GenerarPlanificacionPedido extends Operation {

	private List<PlanificacionPedido> tareasAgendables=new ArrayList<PlanificacionPedido>();
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		Pedido pedido=(Pedido) aParams.get("objeto");
		List<TareaPedido> tareas = pedido.getTareas();
		
		//Todas las tareas deben ser persistidas, y ademas deben ser agregadas a un mapa, para poder generar el grafo de correspondencias...
		Map<String, TareaPedido> tareasEnMapa=new HashMap<String, TareaPedido>();
		for (TareaPedido tareaPedido : tareas) {
//			guardar(tareaPedido);
			tareasEnMapa.put(String.valueOf(tareaPedido.getRandomNumber()), tareaPedido);
		}
		
		/*
		 * A partir de ahora se recorre el mapa, y para cada elemento, se busca en su lista de precedencias (repreentada x un randomNumber, ya que sino gson rompia x ref.circulares,) sus precedences para así generar el grafo de tareas.
		 * Hay que ver donde se asignan estas referencias, donde queda referenciado el grafo, ya que tiene q estar referenciado por que sino no se puede acceder desde nigun lado, no se
		 * sabe cual es la entrada ni demas casos importantes.S
		 */
		Collection<TareaPedido> persistentesEnMapa = tareasEnMapa.values();
		
		for (TareaPedido tareaPedido : persistentesEnMapa) {
			PlanificacionPedido nodoPlanificacion = new PlanificacionPedido();
			nodoPlanificacion.setDato(tareaPedido);
			
			List<Descriptible> precedentesSimples = tareaPedido.getTareasSimples();
			for (Descriptible descriptible : precedentesSimples) {
				PlanificacionPedido nodoPlanificacionHijo = new PlanificacionPedido();
				nodoPlanificacionHijo.setDato(tareasEnMapa.get(descriptible.getCodigo()));
				nodoPlanificacion.agregarPrecedente(nodoPlanificacionHijo);
			}
			tareasAgendables.add(nodoPlanificacion);
		}
		System.out.println();
		
	}

}
