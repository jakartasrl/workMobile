package com.jkt.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jkt.annotations.JKTTransaction;
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

	private static final String WILD_CHAR = "%";
	protected ISessionProvider sessionProvider;
	
	public PersistentEntity save(PersistentEntity entity) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		getSession().save(entity);
		return entity;
	}

	
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

	public List<PersistentEntity> getByProperty(Class className, String propertyName,	String value) {
		Criteria criteria = getSession().createCriteria(className);
		criteria.add(Restrictions.like(propertyName, value));
		return criteria.list();
	}

	
	public PersistentEntity getUniqueByProperty(Class className,String propertyName, Long value) {
		Criteria criteria = getSession().createCriteria(className);
		criteria.add(Restrictions.eq(propertyName, value));
		return (PersistentEntity) criteria.uniqueResult();
	}

	
	public List<PersistentEntity> getByProperties(Class className, Map<String, String> properties) {
		Criteria criteria = getSession().createCriteria(className);
		
		if (properties!=null && !properties.isEmpty()) {
			Entry<String, String> prop;
			for (Iterator<Entry<String, String>> iterator = properties.entrySet().iterator(); iterator.hasNext();) {
				prop = (Entry<String, String>) iterator.next();
				criteria.add(Restrictions.like(prop.getKey(), String.format("%s%s%s", WILD_CHAR, prop.getValue(),WILD_CHAR)));
			}
		}
		return criteria.list();
	}

}
