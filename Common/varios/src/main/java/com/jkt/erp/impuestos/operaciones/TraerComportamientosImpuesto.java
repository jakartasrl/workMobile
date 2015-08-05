package com.jkt.erp.impuestos.operaciones;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.Container;
import com.jkt.operaciones.Operation;

/**
 * Recupera los comportamientos que puede obtener un impuesto
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TraerComportamientosImpuesto extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {

		List comportamientos = Arrays.asList(
				new Container("1","Responsable Exento"), 
				new Container("2", "Responsable Inscripto"), 
				new Container("3","Responsable No Inscripto"), 
				new Container("4","Responsable Monotributo"));

		notificarObjeto("", comportamientos);

	}

}
