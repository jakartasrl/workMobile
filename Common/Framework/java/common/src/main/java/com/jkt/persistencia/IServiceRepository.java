package com.jkt.persistencia;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;






import com.jkt.dominio.PersistentEntity;


/**
 * Interface a implementar por un servicio que maneje transaccionalidad.
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@SuppressWarnings("rawtypes")
public interface IServiceRepository {

	/**
	 * Guarda una entidad
	 * @param entity
	 * @return
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 * @throws ClassNotFoundException 
	 */
	PersistentEntity save(PersistentEntity entity) throws ClassNotFoundException, InstantiationException, IllegalAccessException;
	/**
	 * Usando la clase filtra por un nombre de su campo
	 * @param className
	 * @param propertyName
	 * @param value
	 * @return
	 */
	PersistentEntity getUniqueByProperty(Class className, String propertyName, String value);
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
	 */
	List<PersistentEntity> getByProperties(Class className, Map<String,String> properties);

	/**
	 * Recupera filtrando por una propiedad y la clase
	 * @param className
	 * @param propertyName
	 * @param value
	 * @return
	 */
	PersistentEntity getUniqueByProperty(Class className, String propertyName, Long value);

	
	/**
	 * Recupera todas las entidades de la misma clase, la cual es pasada por parametros.
	 * La clase debe ser de una entidad que soporte persistencia.
	 * @param className
	 * @return
	 * @throws Exception
	 */
	List<PersistentEntity> recuperarTodos(Class className) throws Exception;
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
	List<PersistentEntity> guardarObjetos(List<PersistentEntity> aEntities) throws ClassNotFoundException, InstantiationException, IllegalAccessException;

	/**
	 * Ejecuta un metodo dentro de una transaccion.
	 * @param method
	 * @param instance
	 * @param complexInstance
	 * @throws InvocationTargetException 
	 * @throws IllegalArgumentException 
	 * @throws IllegalAccessException 
	 */
	void executeMethodTransactional(Method method, Object instance, Object complexInstance) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException;
	
}
