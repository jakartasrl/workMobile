package com.jkt.service;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jkt.annotations.JKTTransaction;
import com.jkt.annotations.JKTTransactionReadOnly;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.EntityNotFoundException;
import com.jkt.persistencia.IServiceRepository;

/**
 * Implementacion del servicio.
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Service
@SuppressWarnings("rawtypes")
public class ServiceRepository implements IServiceRepository {

	@Autowired
	private HibernateRepositorio repositorio;
	
	@JKTTransaction
	public PersistentEntity save(PersistentEntity entity) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		PersistentEntity save = repositorio.save(entity);
		return save;
	}

	@JKTTransaction
	public List<PersistentEntity> guardarObjetos(List<PersistentEntity> aEntities) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		for (PersistentEntity persistentEntity : aEntities) {
			repositorio.save(persistentEntity);
		}
		return aEntities;
	}

	@JKTTransactionReadOnly
	public List<PersistentEntity> recuperarTodos(Class clazz) throws Exception {
		return repositorio.getAll(clazz);
	}

	@JKTTransactionReadOnly
	public PersistentEntity getByOid(Class clazz, long id) throws Exception,EntityNotFoundException {
		PersistentEntity entityRetrieved = repositorio.getByOid(clazz, id);
		if (entityRetrieved==null) {
			throw new EntityNotFoundException("No existe la entidad solicitada.");
		}
		return entityRetrieved;
	}

	@JKTTransactionReadOnly
	public PersistentEntity getUniqueByProperty(Class className, String propertyName,	String value) {
		return repositorio.getUniqueByFilter(className, propertyName, value);
	}
	
	@JKTTransactionReadOnly
	public List<PersistentEntity> getByProperty(Class className, String propertyName,	String value) {
		return repositorio.getByFilter(className, propertyName, value);
	}

	@JKTTransactionReadOnly
	public PersistentEntity getUniqueByProperty(Class className,String propertyName, Long value) {
		return repositorio.getUniqueByFilter(className, propertyName, value);
	}
	
	@JKTTransactionReadOnly
	public List<PersistentEntity> getByProperties(Class className, Map<String, String> properties) {
		return repositorio.getByFilters(className, properties);
	}

	@JKTTransactionReadOnly
	public void executeMethodTransactional(Method method, Object instance,Object complexInstance) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		method.invoke(instance, complexInstance);
	}
	
}
