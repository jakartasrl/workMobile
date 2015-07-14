package com.jkt.service;

import javax.annotation.PostConstruct;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.jkt.operaciones.Operation;
import com.jkt.persistencia.ISessionProvider;

/**
 * <h1>Hibernate Session Provider</h1>
 * 
 * <p>Provee a todos los componentes una sesion que se mantendra durante el request.
 * Esta session ser� abierta una sola vez, y cerada al terminar la operacion.
 * Si bien podria hacer esto en todos los lugares donde se necesitas� una sesion, es preferible delegar a cada
 * componente sus responsabilidades
 * </p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Component
@Scope("prototype")
public class SessionProvider implements ISessionProvider{
	
	private static final Logger LOG = Logger.getLogger(SessionProvider.class);
	
	@Autowired
	private SessionFactory sessionFactory;//gets from hibernate and datasource config
	
	private static Session session;
	
//	@SuppressWarnings("restriction")
//	@PostConstruct
//	public void setup(){
//		session=sessionFactory.openSession();
//	}
	public SessionProvider() {
		LOG.info("Iniciando el bean proveedor de sesiones.");
	}
	
	public synchronized Session getSession(){
		if (session==null) {
			session=sessionFactory.openSession();
		}
		return session;
	}

	public synchronized void destroySession() {
		if (session!=null) {
			session.close();
			session=null;
		}
	}
	
}
