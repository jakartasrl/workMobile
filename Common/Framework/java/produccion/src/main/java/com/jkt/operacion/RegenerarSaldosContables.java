package com.jkt.operacion;

import java.util.List;
import java.util.Map;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.Factura;
import com.jkt.operaciones.Operation;
import com.jkt.transformers.Notificacion;

@OperacionBean
public class RegenerarSaldosContables extends Operation {

	public RegenerarSaldosContables() {}
	
	@SuppressWarnings("rawtypes")
	public void execute(Map<String, Object> aParams) throws Exception {
		log.debug(String.format("Se recibio un mapa con cantidad : %d", aParams.size()));
		log.debug(String.format("Contenido del mapa : %s", aParams.toString()));
		aParams.size();//acá ya llega un mapa con una llave y un objeto persistente
		log.debug("Se finalizó la ejecución de la operación.");
		
		List list = (List) aParams.get("factura");
		Factura factura = (Factura) list.get(0);
		
		notificarObjecto(Notificacion.getNew("", factura));


		factura = (Factura) list.get(1);
		notificarObjecto(Notificacion.getNew("", factura));
		
		factura = (Factura) list.get(2);
		notificarObjecto(Notificacion.getNew("", factura));
		
	}

}
