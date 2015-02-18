package com.jkt.operaciones;

import java.util.HashMap;
import java.util.Map;

import com.jkt.dominio.Container;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionDeNegocioException;

/**
 * <p>Operación generica para realizar diferentes validaciones.</p>
 * 
 * @see ValidarExistencia
 * @see ValidarExistenciaConMaestro
 * @see ValidarInexistencia
 * @see ValidarInexistenciaConMaestro
 * @see Operation
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public abstract class Validar extends Operation{
	
	/**
	 * <p>Campo por el cual es filtrada la entidad recibida.</p>
	 * <p>El campo principal de filtro en esta operación será el código.</p>
	 */

	protected static final String ENTIDAD_FIELD = "entidad".toUpperCase();
	protected static final String CAMPO_VALIDADO_FIELD = "campoValidado".toUpperCase();
	protected static final Object OID_MAESTRO_FIELD = "oidentidadmaestra".toUpperCase();
	protected static final Object ENTIDAD_MAESTRO_FIELD = "entidadmaestra".toUpperCase();

	protected String campoAFiltrar;
	protected String valorAFiltrar;
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {

		validacionesDeEntrada(aParams);

		recuperarValor(aParams);
		
		PersistentEntity objectRetrieved = manejarFiltros(aParams);
		manejoDeExistencia(objectRetrieved,(String) aParams.get(ENTIDAD_FIELD), valorAFiltrar);
		
	}

	/**
	 * Recupera de los parametros en formato mapa, los datos necesarios para el filtro
	 * 
	 */
	private void recuperarValor(Map<String, Object> aParams) {
		campoAFiltrar = (String) aParams.get(CAMPO_VALIDADO_FIELD);
		valorAFiltrar = (String) aParams.get(campoAFiltrar.toUpperCase());
	}

	/**
	 * <p>Valida que el mapa de parametros no sea vacio nunca.</p>
	 * <p>Del mismo modo valida los campos necesarios para todas las operaciones que son subclase.</p>
	 * @param aParams mapa de parametros.
	 * @throws JakartaException si el mapa viene vacio, o si no se encuentra alguno de los campos necesarios para el correcto funcionamiento de la operacion.
	 * 
	 */
	private void validacionesDeEntrada(Map<String, Object> aParams)throws JakartaException {
		verificarMapaVacio(aParams);
		validarEntrada(aParams.get(ENTIDAD_FIELD));
		validarEntrada(aParams.get(CAMPO_VALIDADO_FIELD));
	}
	
	/*
	 * Template method.
	 * Los diferentes comportamientos ejecutan estos metodos, y llaman a los metodos declarados en esta clase, mas abajo, como protected.
	 */
	protected abstract PersistentEntity manejarFiltros(Map<String, Object> aParams) throws ClassNotFoundException, JakartaException, Exception;
	protected abstract void manejoDeExistencia(PersistentEntity entity,String className, String codigo)throws ValidacionDeNegocioException;

	
	/**
	 * <p>Maneja un filtro avanzado, filtrando una entidad por codigo, y por el identificador de su dueño en la relacion.</p>
	 * <p>(El dueño de una provincia es Pais, el dueño de un detalle de condicion de pago, es su correspondiente condición de pago)</p>
	 * 
	 */
	protected PersistentEntity manejarFiltrosComplejos(Map<String, Object> aParams) throws ClassNotFoundException, JakartaException {
		String className=(String) aParams.get(ENTIDAD_FIELD);
		String oidMaestro=(String) aParams.get(OID_MAESTRO_FIELD);
		String classNameMaestro=(String) aParams.get(ENTIDAD_MAESTRO_FIELD);
		
		
		Map<String, Object> filtros = new HashMap<String, Object>();
		filtros.put(campoAFiltrar, valorAFiltrar);
		filtros.put(classNameMaestro.concat(".id"), Long.valueOf(oidMaestro));
		
		PersistentEntity objectRetrieved = serviceRepository.getByProperties(Class.forName(this.getRepositorioClases().getClass(className)), filtros);
		return objectRetrieved;
		
	}
	
	
	
	/**
	 * Realiza un filtro simple utilizando una entidad y un id.
	 */
	protected PersistentEntity manejarFiltroSimple(Map<String, Object> aParams) throws ClassNotFoundException, JakartaException{
		/*
		 * Recupera de los parametros el codigo y el nombre de la entidad
		 */
		String className=(String) aParams.get(ENTIDAD_FIELD);
		
		//Realiza la consulta a la base
		PersistentEntity objectRetrieved = serviceRepository.getUniqueByProperty(Class.forName(this.getRepositorioClases().getClass(className)), campoAFiltrar, valorAFiltrar);
		return objectRetrieved;
	}
	
	
	
	
	/**
	 * Cuando se desea manejar la existencia de una entidad, se ejecuta este metodo.
	 * 
	 */
	protected void manejarExistencia(PersistentEntity entity, String className,String codigo) throws ValidacionDeNegocioException {
		if (codigo.isEmpty() || codigo.trim().equals("")){
			entity = new Container("vacio");
		}
		if (entity==null) {
			throw new ValidacionDeNegocioException(String.format("El codigo solicitado no existe.", className, codigo));
		}
		notificarObjeto("resultado", entity);
	}
	
	
	
	/**
	 * 
	 * Para darle un manejo diferente a la entidad buscada. Si la rutina buscada es la inexistencia, se ejecutará este metodo.
	 * 
	 */
	protected void manejarInexistencia(PersistentEntity entity, String className, String codigo) throws ValidacionDeNegocioException {
		if (entity!=null) {
			throw new ValidacionDeNegocioException("Codigo existente.");
		}
	}
	
}
