package com.jkt.operaciones;

import java.util.HashMap;
import java.util.Map;

import com.jkt.dominio.Container;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionException;
import com.jkt.transformers.Notificacion;

/**
 * Operacion generica para validar existencia, o no existencia.
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public abstract class Validar extends Operation{

	protected static final String ENTIDAD_FIELD = "entidad".toUpperCase();
	protected static final String CODIGO_FIELD = "codigo".toUpperCase();
	protected static final Object OID_MAESTRO_FIELD = "oidentidadmaestra".toUpperCase();
	protected static final Object ENTIDAD_MAESTRO_FIELD = "entidadmaestra".toUpperCase();


	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		PersistentEntity objectRetrieved = manejarFiltros(aParams);
		manejoDeExistencia(objectRetrieved,(String) aParams.get(ENTIDAD_FIELD), (String) aParams.get(CODIGO_FIELD));
		
	}
	
	protected abstract PersistentEntity manejarFiltros(Map<String, Object> aParams) throws ClassNotFoundException, JakartaException;
	protected abstract void manejoDeExistencia(PersistentEntity entity,String className, String codigo)throws ValidacionException;

	
	protected PersistentEntity manejarFiltrosComplejos(Map<String, Object> aParams) throws ClassNotFoundException, JakartaException {
		String codigo=(String) aParams.get(CODIGO_FIELD);
		String className=(String) aParams.get(ENTIDAD_FIELD);
		String oidMaestro=(String) aParams.get(OID_MAESTRO_FIELD);
		String classNameMaestro=(String) aParams.get(ENTIDAD_MAESTRO_FIELD);
		
		
		Map<String, Object> filtros = new HashMap<String, Object>();
		filtros.put("codigo", codigo);
		filtros.put(classNameMaestro.concat(".id"), Long.valueOf(oidMaestro));
		
		PersistentEntity objectRetrieved = serviceRepository.getByProperties(Class.forName(this.getRepositorioClases().getClass(className)), filtros);
		return objectRetrieved;
		
	}
	
	
	
	protected PersistentEntity manejarFiltroSimple(Map<String, Object> aParams) throws ClassNotFoundException, JakartaException{
		/*
		 * Recupera de los parametros el codigo y el nombre de la entidad
		 */
		String codigo=(String) aParams.get(CODIGO_FIELD);
		String className=(String) aParams.get(ENTIDAD_FIELD);
		
		//Realiza la consulta a la base
		PersistentEntity objectRetrieved = serviceRepository.getUniqueByProperty(Class.forName(this.getRepositorioClases().getClass(className)), "codigo", codigo);
		return objectRetrieved;
	}
	
	
	
	
	protected void manejarExistencia(PersistentEntity entity, String className,String codigo) throws ValidacionException {
		if (codigo.isEmpty() || codigo.trim().equals("")){
			entity = new Container("vacio");
		}
		if (entity==null) {
			throw new ValidacionException(String.format("El codigo solicitado no existe.", className, codigo));
		}
		notificarObjecto(Notificacion.getNew("resultado", entity));
	}
	
	
	
	protected void manejarInexistencia(PersistentEntity entity, String className, String codigo) throws ValidacionException {
		if (entity!=null) {
			throw new ValidacionException("Codigo existente.");
		}
	}
	
	
}
