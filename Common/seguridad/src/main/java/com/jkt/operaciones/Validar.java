package com.jkt.operaciones;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.Container;
import com.jkt.dominio.Filtro;
import com.jkt.dominio.IDetalle;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionDeNegocioException;

/**
 * <p>Operaci�n generica para realizar diferentes validaciones.</p>
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
	 * <p>El campo principal de filtro en esta operaci�n ser� el c�digo.</p>
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
//		valorAFiltrar = (String) aParams.get(campoAFiltrar.toUpperCase());
		valorAFiltrar = (String) aParams.get("CODIGO");
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
	 * <p>Maneja un filtro avanzado, filtrando una entidad por codigo, y por el identificador de su due�o en la relacion.</p>
	 * <p>(El due�o de una provincia es Pais, el due�o de un detalle de condicion de pago, es su correspondiente condici�n de pago)</p>
	 * 
	 */
	@SuppressWarnings("unchecked")
	protected PersistentEntity manejarFiltrosComplejos(Map<String, Object> aParams) throws ClassNotFoundException, JakartaException {
		String nombreEntidad=(String) aParams.get(ENTIDAD_FIELD);
		String oidMaestro=(String) aParams.get(OID_MAESTRO_FIELD);
		
		Class<?> clazz = null;
		Object newInstance = null;
		
		try {
			clazz = Class.forName(getRepositorioClases().getClass(nombreEntidad));
			newInstance = clazz.newInstance();
			
			if (!IDetalle.class.isAssignableFrom(clazz)) {
				throw new JakartaException(String.format("La entidad %s no es un detalle de la relacion maestro-detalle.", clazz.getSimpleName()));
			}
			
		} catch (InstantiationException e) {
			levantarExcepcion();
		} catch (IllegalAccessException e) {
			levantarExcepcion();
		} catch (ClassNotFoundException e) {
			levantarExcepcion();
		}
		
		
		Filtro filtroActivo = crearFiltro("activo","true","igual","boolean");
		Filtro filtroEntidad = crearFiltro(campoAFiltrar,valorAFiltrar,"igual","string");

		IDetalle detalle=(IDetalle) newInstance;
		Filtro filtroMaestro = crearFiltro(detalle.getNombreDeMaestro().concat(".id"),oidMaestro,"igual","integer");
		

		/*
		 * Por ahora esto servir�, pero es primordial un refactor cuando se pueda TODO FIXME
		 */
		List<PersistentEntity> results = serviceRepository.getByProperties(clazz, Arrays.asList(filtroActivo,filtroMaestro, filtroEntidad));
		if (results.size()>1) {
			throw new JakartaException("Existe mas de una entidad para el filtro solicitado, esto es una inconsistencia.");
		}
		
		if (results.isEmpty()) {
			return null;
		}else{
			return results.get(0);
		}
		
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
	 * Para darle un manejo diferente a la entidad buscada. Si la rutina buscada es la inexistencia, se ejecutar� este metodo.
	 * 
	 */
	protected void manejarInexistencia(PersistentEntity entity, String className, String codigo) throws ValidacionDeNegocioException {
		if (entity!=null) {
			throw new ValidacionDeNegocioException("Codigo existente.");
		}
	}
	
	
	/*
	 * Helper methods para levantar excepciones y para crear filtros rapidamente.
	 * 
	 */
	
	
	
	private void levantarExcepcion() throws JakartaException {
		throw new JakartaException("Ocurri� un error al intentar recuperar la clase solicitada.");		
	}
	
	protected Filtro crearFiltro(String nombre, String valor, String condicion,String tipo) {
		Filtro filtro = new Filtro();
		
		filtro.setCondicion(condicion);
		filtro.setNombre(nombre);
		filtro.setValor(valor);
		filtro.setTipoDeDato(tipo);
		
		return filtro;
	}

	
}
