package com.jkt.pedido.operaciones;

import java.util.Date;
import java.util.Map;

import org.joda.time.LocalDate;

import com.jkt.grafo.DatoNodo.Estado;
import com.jkt.operaciones.Operation;
import com.jkt.pedido.dominio.TareaPedido;

/**
 * Esta operacion lo unico que hace es actualizar el estado de una tarea.
 * Al hacer una operacion simple evito mandar 50 datos por xml.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ActualizarComentarioTarea extends Operation {

	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		TareaPedido tarea = (TareaPedido) aParams.get("objeto");
		
		TareaPedido t = (TareaPedido) obtener(TareaPedido.class, tarea.getId()); //recupera de la base el objeto

		guardar(t);
	}

}
