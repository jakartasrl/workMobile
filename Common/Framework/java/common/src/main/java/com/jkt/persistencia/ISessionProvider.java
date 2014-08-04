package com.jkt.persistencia;

import org.hibernate.Session;

/**
 * Declara los metodos para ser implementados por un proveedor de sessiones.
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public interface ISessionProvider {

	Session getSession();
	void destroySession();

}

