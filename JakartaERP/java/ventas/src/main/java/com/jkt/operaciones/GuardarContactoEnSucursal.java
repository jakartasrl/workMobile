package com.jkt.operaciones;

import java.util.Map;

import com.jkt.erp.varios.ClienteSucursal;
import com.jkt.varios.dominio.Contacto;

public class GuardarContactoEnSucursal extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		Contacto c = (Contacto) aParams.get("objeto");
		c.setTratamiento("EMPLEADO");
		ClienteSucursal sucursal = (ClienteSucursal) obtener(ClienteSucursal.class,c.getClienteSucursalId());
		sucursal.addContacto(c);
		guardar(sucursal);
		notificarObjeto("", c);
	}

}
