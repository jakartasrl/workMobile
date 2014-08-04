package com.jkt.service;

import javax.annotation.PostConstruct;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * Provee a todos los componentes una sesion que se mantendra durante el request.
 * Esta session será abierta una sola vez, y cerada al terminar la operacion.
 * Si bien podria hacer esto en todos los lugares donde se necesitasé una sesion, es preferible delegar a cada
 * componente sus responsabilidades
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Component
@Scope("request")
public class SessionProvider {
	
	@Autowired
	private SessionFactory sessionFactory;//gets from hibernate and datasource config
	
	private static Session session;
	
	@SuppressWarnings("restriction")
	@PostConstruct
	public void setup(){
		session=sessionFactory.openSession();
	}
	
	public static Session getSession(){
		return session;
	}
	
}
