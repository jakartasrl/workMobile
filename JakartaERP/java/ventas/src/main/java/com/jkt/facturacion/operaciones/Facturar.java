package com.jkt.facturacion.operaciones;

import java.util.Map;

import com.jkt.facturacion.dominio.FacturadorProtocolo;
import com.jkt.facturacion.dominio.JakartaERPFacturador;
import com.jkt.laboratorio.dominio.Protocolo;
import com.jkt.operaciones.Operation;
import com.jkt.pedido.dominio.Pedido;

public class Facturar extends Operation {

	private static final String KEY_ENTIDAD_UPPER = "ENTIDAD";
	private static final String KEY_OID = "ID";
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams.get(KEY_OID));
		log.info("Recuperando protocolo con id "+(String)aParams.get(KEY_OID));
		Protocolo protocolo = (Protocolo) obtener(Protocolo.class, (String)aParams.get(KEY_OID));
		
		
		long idPedido = protocolo.getIdPedido();
		if(idPedido!=0L){
			log.info("Recuperando pedido desde protocolo");
			Pedido pedido = (Pedido) obtener(Pedido.class, String.valueOf(idPedido));
		}
		
		JakartaERPFacturador facturador = new FacturadorProtocolo(getServiceRepository());
		facturador.ejecutarFacturacion(protocolo);
		
	}

}
