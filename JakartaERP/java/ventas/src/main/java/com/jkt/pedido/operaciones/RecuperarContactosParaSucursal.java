package com.jkt.pedido.operaciones;

import java.util.Map;

import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.varios.ClienteSucursal;
import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.Contacto;

/**
 * 
 * {@link Contacto} es una entidad generica, no puede tener relaciones a demas entidades.
 * De este modo, es imposible utilizar los helps genericos, con lo cual se arma una operacion simple.
 * 
 * @author ssuarez
 *
 */
public class RecuperarContactosParaSucursal extends Operation {

	private static final String ID_SUCURSAL = "ID_SUCURSAL";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		validarEntrada(aParams.get(ID_SUCURSAL));
		ClienteSucursal sucursal = (ClienteSucursal) obtener(ClienteSucursal.class, String.valueOf(aParams.get(ID_SUCURSAL)));
		notificarObjeto("", sucursal.getContactos());
	}

}
