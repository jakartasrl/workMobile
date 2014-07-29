package com.jkt.operacion;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.Factura;
//import com.jkt.entities.Factura;
import com.jkt.operaciones.Operation;
import com.jkt.transformers.Notificacion;

@OperacionBean
public class ConsultarSaldos extends Operation {

	public ConsultarSaldos() {}

	protected static final Logger log = Logger.getLogger(ConsultarSaldos.class);

	@SuppressWarnings("rawtypes")
	public void execute(Map<String, Object> aParams)throws Exception {
		List list = (List) aParams.get("factura");
		
		Factura factura = (Factura) list.get(0);
//		factura.setNombre("daeee");
//		this.notificarObjecto(Notificacion.getNew("salida2", factura));
//		factura.setCodigoPostal(199999);
//		this.notificarObjecto(Notificacion.getNew("salida", factura));
//		this.notificarObjecto(Notificacion.getNew("salida2", factura));
		
		this.guardar(factura);
	}

	private void guardar(Factura factura) throws ClassNotFoundException, InstantiationException, IllegalAccessException{
		serviceRepository.save(factura);
	}

}
