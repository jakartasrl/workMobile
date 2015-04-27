package com.jkt.presupuesto.operaciones;

import java.util.List;
import java.util.Map;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.operaciones.Operation;

public class GuardarCotizacion extends Operation {
	
	private static final String WRITER_COTIZACION = "cotizacion";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		List object = recuperarObjeto(aParams);
		if (object == null) {
			throw new JakartaException("Error en el archivo operaciones.xml. Dentro del tag INPUT, el atributo 'keyName' debe llamarse 'objeto'.");
		}
		guardar(object);
		
	}
	
	protected void guardar(List object) throws ClassNotFoundException, InstantiationException, IllegalAccessException, ValidacionDeNegocioException, JakartaException {
		Object objectToSave = object.get(0);
		serviceRepository.save((PersistentEntity) objectToSave);
		notificarObjeto(WRITER_COTIZACION, objectToSave);
	}

}
