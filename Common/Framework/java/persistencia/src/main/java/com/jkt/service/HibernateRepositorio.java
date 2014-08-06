package com.jkt.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.joda.time.LocalDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jkt.dominio.HistorialPassword;
import com.jkt.dominio.PersistentEntity;
import com.jkt.dominio.Usuario;
import com.jkt.eventos.EventoGuardar;
import com.jkt.eventos.ManagerEventos;


/**
 * Implementación del repositorio en hibernate.
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Repository
public class HibernateRepositorio {

	private static final String WILD_CHAR = "%";

	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private ManagerEventos manager;
	
	
	
	/**
	 * Retorna la sesion actual para realizar operaciones de modo seguro
	 * 
	 * @return La sesion actual.
	 */
	private Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}
	
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
	public PersistentEntity getByOid(@SuppressWarnings("rawtypes") Class clazz, long id) throws Exception {
//		Session session = getSession();
		
		Session sess = sessionFactory.openSession();
		
		
//		Session sess=getSession();
		Transaction tx=sess.beginTransaction();
		//do something using teh session
//		sess.save(obj);

		Object persistentEntity = sess.get(clazz, id);
		
		Usuario usuario;
		usuario=(Usuario) persistentEntity;
		
		HistorialPassword password=new HistorialPassword();
		password.setPassword("leonel".getBytes());
		password.setFechaVencimiento(LocalDateTime.now());
		
		usuario.addPassword(password);
		
		tx.commit();
		sess.close();

		return null;
//		return (PersistentEntity) sess.get(clazz, id);
	}

	/**
	 * Guarda una entidad
	 * 
	 * @param entidad a guardar
	 * @return La entidad guardada
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 * @throws ClassNotFoundException 
	 */
	public PersistentEntity save(PersistentEntity entity) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		this.getSession().saveOrUpdate(entity);
		manager.manejarEvento(new EventoGuardar(entity.getClass(), entity));
		return entity;
	}

	
	/**
	 * Recupera todos los elementos de algun tipo dado, en formato de Class
	 * 
	 * @param clazz para filtrar.
	 * @return Lista de entidades que se corresponden con el tipo (persistent) pasado como parametro.
	 * @throws Exception
	 */
	public List<PersistentEntity> getAll(Class clazz) throws Exception {
		Criteria criteria = this.getSession().createCriteria(clazz);
		criteria.add(Restrictions.eq("activo", true));
		return criteria.list();
	}
	
	/**
	 * @param clazz Tipo de clase para filtrar primero por clase.
	 * @param property que representa a la llave del valor que se comparara con value
	 * @param value el valor crudo a comparar.
	 * @return {@link PersistentEntity} o null si no hubo resultados.
	 */
	public PersistentEntity getUniqueByFilter(Class clazz, String property, String value){
		Criteria criteria = getSession().createCriteria(clazz);
		criteria.add(Restrictions.eq(property, value));
		return (PersistentEntity) criteria.uniqueResult();
	}
	
	/**
	 * @param clazz Tipo de clase para filtrar primero por clase.
	 * @param property que representa a la llave del valor que se comparara con value
	 * @param value el valor crudo a comparar.
	 * @return {@link PersistentEntity} o null si no hubo resultados.
	 */
	public PersistentEntity getUniqueByFilter(Class clazz, String property, Long value){
		Criteria criteria = getSession().createCriteria(clazz);
		criteria.add(Restrictions.eq(property, value));
		return (PersistentEntity) criteria.uniqueResult();
	}
	
	/**
	 * @param clazz Tipo de clase para filtrar primero por clase.
	 * @param property que representa a la llave del valor que se comparara con value
	 * @param value el valor crudo a comparar.
	 * @return {@link PersistentEntity} o null si no hubo resultados.
	 */
	public List<PersistentEntity> getByFilter(Class clazz, String property, String value){
		Criteria criteria = getSession().createCriteria(clazz);
		criteria.add(Restrictions.like(property, value));
		return criteria.list();
	}
	
	/**
	 * 
	 * Filtra sobre una clase usando N filtros.
	 * 
	 * @param clazz Tipo de clase para filtrar
	 * @param filtros Un mapa con los campos para filtrar
	 * @return
	 */
	public List<PersistentEntity> getByFilters(Class clazz, Map<String,String> filtros){
		Criteria criteria = getSession().createCriteria(clazz);
		
		if (filtros!=null && !filtros.isEmpty()) {
			Entry<String, String> prop;
			for (Iterator<Entry<String, String>> iterator = filtros.entrySet().iterator(); iterator.hasNext();) {
				prop = (Entry<String, String>) iterator.next();
				criteria.add(Restrictions.like(prop.getKey(), String.format("%s%s%s", WILD_CHAR, prop.getValue(),WILD_CHAR)));
			}
		}
		
		return criteria.list();
	}

}
