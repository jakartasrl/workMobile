package com.jkt.operaciones;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionDeNegocioException;

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

	protected void guardar(List object) throws ClassNotFoundException, InstantiationException, IllegalAccessException, ValidacionDeNegocioException, JakartaException {
		PersistentEntity objToSave = (PersistentEntity) object.get(0);
		objToSave.setModificationDate(new Date());
		serviceRepository.save(objToSave);//save the first
		
		if(CLIENTE_HTML.equals(this.getTipoCliente())){
			notificarObjeto("", objToSave);
		}

	}

}
