package com.jkt.operaciones;

import java.util.List;
import java.util.Map;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionException;

/**
 * Esta operacion recibe una entidad y la persiste.
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@OperacionBean
public class Guardar extends Operation {

	@SuppressWarnings("rawtypes")
	public void execute(Map<String, Object> aParams) throws Exception {
		List object = recuperarObjeto(aParams);
		if (object==null){ 
			throw new JakartaException("Error en el archivo operaciones.xml. Dentro del tag INPUT, el atributo 'keyName' debe llamarse 'objeto'.");
		}
		guardar(object);
	}

	protected void guardar(List object) throws ClassNotFoundException, InstantiationException, IllegalAccessException, ValidacionException, JakartaException {
		serviceRepository.save((PersistentEntity) object.get(0));//save the first
	}

}
