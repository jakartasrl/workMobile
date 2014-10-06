package com.jkt.operaciones;

import java.util.List;

import com.jkt.annotations.OperacionBean;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionException;

/**
 * Esta operacion recibe una lista de entidades y persiste a las mismas.
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@OperacionBean
public class GuardarLista extends Guardar {

	@SuppressWarnings("unchecked")
	protected void guardar(List object) throws ClassNotFoundException, InstantiationException, IllegalAccessException, ValidacionException, JakartaException {
		this.serviceRepository.guardarObjetos(object);
	}

}

