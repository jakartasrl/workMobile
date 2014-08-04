package com.jkt.service;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jkt.annotations.JKTTransaction;
import com.jkt.annotations.JKTTransactionReadOnly;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.EntityNotFoundException;
import com.jkt.persistencia.IServiceRepository;
import com.jkt.persistencia.ISessionProvider;

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
		getSession().save(entity);
		return entity;
	}

	protected ISessionProvider sessionProvider;
	
	@Autowired
	public void setSessionProvider(ISessionProvider sessionProvider) {
		this.sessionProvider=sessionProvider;
	}
	
	private Session getSession(){
		return sessionProvider.getSession();
	}

	public List<PersistentEntity> guardarObjetos(List<PersistentEntity> aEntities) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		for (PersistentEntity persistentEntity : aEntities) {
			getSession().save(persistentEntity);
		}
		return aEntities;
	}
	
	public List<PersistentEntity> getAll(Class clazz) throws Exception {
		Criteria criteria = getSession().createCriteria(clazz);
		return criteria.list();
	}

	public PersistentEntity getByOid(Class clazz, long id) throws Exception,EntityNotFoundException {
		PersistentEntity entityRetrieved = (PersistentEntity) getSession().get(clazz, id);
		if (entityRetrieved==null) {
			throw new EntityNotFoundException("No existe la entidad solicitada.");
		}
		return entityRetrieved;
	}
	
	public PersistentEntity getUniqueByProperty(Class className, String propertyName,	String value) {
		Criteria criteria = getSession().createCriteria(className);
		criteria.add(Restrictions.eq(propertyName, value));
		return (PersistentEntity) criteria.uniqueResult();
	}

	/*
	 * 
	 * FALTA MODIFICAR DE ACA PARA ABAJO
	 * 
	 * 
	 */
	
	
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

}
