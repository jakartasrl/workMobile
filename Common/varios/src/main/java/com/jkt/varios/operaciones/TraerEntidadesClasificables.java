package com.jkt.varios.operaciones;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.Container;
import com.jkt.operaciones.Operation;

/**
 * <p>Operacion que se encarga de proveer a los clientes de todas las clases que pueden ser clasificables por algun criterio en particular.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@OperacionBean
public class TraerEntidadesClasificables extends Operation {
	
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {

		List<Container> entidades = Arrays.asList(new Container("1", "Empresa"),new Container("2", "Usuario"),new Container("3", "Cliente"),new Container("4", "ClienteSucursal"),new Container("5", "Producto"),new Container("6", "Domicilio de entrega"));
		for (Container container : entidades) {
			notificarObjecto("entidades", container);
		}
		
	}

}
