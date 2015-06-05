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
public class ActualizarEstadoTarea extends Operation {

	private static final String ESTADO = "ESTADO";
	private static final String OID = "OID";
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		String idTarea = (String) aParams.get(OID);
		String idEstado = (String) aParams.get(ESTADO);
		
//		LocalDate.parse((String) ).toDate();
		
		Date fechaUltimoPrecedente = (Date) aParams.get("FECHA_ULTIMO_PRECEDENTE");//((  ((String) aParams.get("FECHA_ULTIMO_PRECEDENTE"));//FECHA_CUMPLIMIENTO
		Date fechaCumplimiento = (Date) aParams.get("FECHA_CUMPLIMIENTO");//((  ((String) aParams.get("FECHA_ULTIMO_PRECEDENTE"));//FECHA_CUMPLIMIENTO
		
		TareaPedido t = (TareaPedido) obtener(TareaPedido.class, idTarea);
		t.setEstado(Estado.getEstado(Integer.valueOf(idEstado).intValue()));
		t.setIdEstado(Integer.valueOf(idEstado).intValue());
		
		if(fechaCumplimiento!=null){
			t.setFechaCumplimiento(fechaCumplimiento);
		}
		
		if(fechaUltimoPrecedente!=null){
			t.setFechaUltimoPrecedente(fechaUltimoPrecedente);
		}

		guardar(t);
	}

}
