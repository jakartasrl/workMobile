package com.jkt.persistencia;

import java.util.List;
import java.util.Map;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.JakartaException;
import com.jkt.excepcion.ValidacionException;
import com.jkt.util.IRepositorioClases;


/**
 * Interface a implementar por un servicio que maneje transaccionalidad.
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@SuppressWarnings("rawtypes")
public interface IServiceRepository {

	PersistentEntity getByProperties(Class className, Map<String,Object> map) throws JakartaException;
	
	/**
	 * Guarda una entidad.
	 * 
	 * @param entity a guardar
	 * @return
	 * @throws IllegalAccessException  
	 * @throws InstantiationException  
	 * @throws ClassNotFoundException 
	 */
	PersistentEntity save(PersistentEntity entity) throws ClassNotFoundException, InstantiationException, IllegalAccessException, ValidacionException;
	/**
	 * Usando la clase filtra por un nombre de su campo
	 * @param className
	 * @param propertyName
	 * @param value
	 * @return
	 * @throws JakartaException 
	 */
	PersistentEntity getUniqueByProperty(Class className, String propertyName, String value) throws JakartaException;
	/**
	 * Recupera filtrando por una propiedad y la clase
	 * @param className
	 * @param propertyName
	 * @param value
	 * @return
	 */
	List<PersistentEntity> getByProperty(Class className, String propertyName, String value);

	
	/**
	 * Filtra usando varias condiciones que residen en un mapa <String,String>
	 * 
	 * @param className
	 * @param properties
	 * @return
	 * @throws JakartaException 
	 */
	List<PersistentEntity> getByProperties(Class className, List properties) throws JakartaException;

	/**
	 * Recupera filtrando por una propiedad y la clase
	 * @param className
	 * @param propertyName
	 * @param value
	 * @return
	 * @throws JakartaException 
	 */
	PersistentEntity getUniqueByProperty(Class className, String propertyName, Long value) throws JakartaException;

	
	/**
	 * Recupera todas las entidades de la misma clase, la cual es pasada por parametros.
	 * La clase debe ser de una entidad que soporte persistencia.
	 * @param className
	 * @return
	 * @throws Exception
	 */
	List<PersistentEntity> getAll(Class className) throws Exception;
	/**
	 * Recupera usando la clase y un id una entidad
	 * @param className
	 * @param id
	 * @return
	 * @throws Exception
	 */
	PersistentEntity getByOid(Class className, long id) throws Exception;
	/**
	 * Guarda una lista de objetos.Si se produce un error en alguno se realiza rollback de todos.
	 * @param aEntities
	 * @return
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 * @throws ClassNotFoundException 
	 */
	List<PersistentEntity> guardarObjetos(List<PersistentEntity> aEntities) throws ClassNotFoundException, InstantiationException, IllegalAccessException, ValidacionException;
	/**
	 * La clase concreta debe implementar este metodo para recibir un proveedor de sesiones e inyectarlo
	 * 
	 * @param sessionProvider
	 */
	void setSessionProvider(ISessionProvider sessionProvider);
	void setRepositorioClases(IRepositorioClases repositorio);
	
}
