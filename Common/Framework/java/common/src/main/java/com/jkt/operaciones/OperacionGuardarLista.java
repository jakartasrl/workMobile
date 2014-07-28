package com.jkt.operaciones;

import java.util.List;

import com.jkt.annotations.OperacionBean;

/**
 * Esta operacion recibe una lista de entidades persiste a las mismas.
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@OperacionBean
public class OperacionGuardarLista extends OperacionGuardar {

	@SuppressWarnings("unchecked")
	protected void guardar(List object) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		this.serviceRepository.guardarObjetos(object);
	}

}

