package com.jkt.cotizador.operaciones;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.Container;
import com.jkt.operaciones.Operation;

public class TraerTiposDeVenta extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		List<Container> entidades = Arrays.asList(new Container("1", "Venta"),new Container("2", "Reparacion"));
		for (Container container : entidades) {
			notificarObjeto("entidades", container);
		}
	}

}
