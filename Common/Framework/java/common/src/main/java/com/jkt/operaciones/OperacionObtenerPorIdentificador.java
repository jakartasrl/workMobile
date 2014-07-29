package com.jkt.operaciones;

import java.util.Map;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.Filtro;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.EntityNotFoundException;
import com.jkt.excepcion.JakartaException;
import com.jkt.transformers.Notificacion;

@OperacionBean
public class OperacionObtenerPorIdentificador extends Operation{

	public void execute(Map<String, Object> aParams) throws Exception {
		Filtro filtro = (Filtro) aParams.get("objeto");
		Map<String, String> mapa = filtro.valoresToMap();
		
		//Validar el filtro y el parametro recibido
		validar(filtro, mapa);
		
		PersistentEntity objectRetrieved = this.serviceRepository.getUniqueByProperty(Class.forName(filtro.getClase()), "id", Long.valueOf(mapa.get("id")));
		if (objectRetrieved==null) {
			throw new EntityNotFoundException("No existe la entidad que se corresponda con el ID proporcionado.");
		}
		this.notificarObjecto(Notificacion.getNew("sal", objectRetrieved));

	}

	private void validar(Filtro filtro, Map<String, String> mapa) throws JakartaException {
		if (filtro.getClase()==null || mapa.isEmpty() || mapa.get("id")==null) {
			throw new JakartaException("Operacion mal formada.");
		}
		
	}

}
