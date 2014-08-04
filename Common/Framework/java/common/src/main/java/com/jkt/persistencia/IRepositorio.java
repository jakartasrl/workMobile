package com.jkt.persistencia;

import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import com.jkt.dominio.PersistentEntity;

public interface IRepositorio {

	void setSession(Session session);
	
	/**
	 * 
	 * 
	 * TODO Cambiar esta implementacion por solamente getById
	 * Retorna una entidad desde la base de datos.
	 * 
	 * IMPORTANTE: Si la entidad fue consultada recientemente, la cache de hibernate evita el hit contra la base de datos.
	 * Entonces, la consulta puede ser sobre la base o sobre la cache.
	 * 
	 * @param clazz para filtrar por clase
	 * @param id 
	 * @return Una entidad
	 * @throws Exception Si pasa como parametro una entidad no persistente.
	 */
	public abstract PersistentEntity getByOid(Class clazz, long id)
			throws Exception;

	/**
	 * Guarda una entidad
	 * 
	 * @param entidad a guardar
	 * @return La entidad guardada
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 * @throws ClassNotFoundException 
	 */
	public abstract PersistentEntity save(PersistentEntity entity)
			throws ClassNotFoundException, InstantiationException,
			IllegalAccessException;

	/**
	 * Recupera todos los elementos de algun tipo dado, en formato de Class
	 * 
	 * @param clazz para filtrar.
	 * @return Lista de entidades que se corresponden con el tipo (persistent) pasado como parametro.
	 * @throws Exception
	 */
	public abstract List<PersistentEntity> getAll(Class clazz) throws Exception;

	/**
	 * @param clazz Tipo de clase para filtrar primero por clase.
	 * @param property que representa a la llave del valor que se comparara con value
	 * @param value el valor crudo a comparar.
	 * @return {@link PersistentEntity} o null si no hubo resultados.
	 */
	public abstract PersistentEntity getUniqueByFilter(Class clazz,
			String property, String value);

	/**
	 * @param clazz Tipo de clase para filtrar primero por clase.
	 * @param property que representa a la llave del valor que se comparara con value
	 * @param value el valor crudo a comparar.
	 * @return {@link PersistentEntity} o null si no hubo resultados.
	 */
	public abstract PersistentEntity getUniqueByFilter(Class clazz,
			String property, Long value);

	/**
	 * @param clazz Tipo de clase para filtrar primero por clase.
	 * @param property que representa a la llave del valor que se comparara con value
	 * @param value el valor crudo a comparar.
	 * @return {@link PersistentEntity} o null si no hubo resultados.
	 */
	public abstract List<PersistentEntity> getByFilter(Class clazz,
			String property, String value);

	/**
	 * 
	 * Filtra sobre una clase usando N filtros.
	 * 
	 * @param clazz Tipo de clase para filtrar
	 * @param filtros Un mapa con los campos para filtrar
	 * @return
	 */
	public abstract List<PersistentEntity> getByFilters(Class clazz,
			Map<String, String> filtros);

}