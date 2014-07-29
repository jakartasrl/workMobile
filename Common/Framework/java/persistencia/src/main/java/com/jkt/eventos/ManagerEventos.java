package com.jkt.eventos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jkt.contexto.ApplicationContext;
import com.jkt.service.ServiceRepository;

/**
 * Administra los observadores a eventos que tiene cada clase persistente
 *
 * @author Leonel Suarez - Jakarta SRL
 */
@Component
public class ManagerEventos {
	
	@Autowired
	private ApplicationContext applicationContext;
	
	@Autowired
	private ServiceRepository serviceRepository;
	
	/**
	 * Main method!
	 * 
	 * @param evento
	 * @throws ClassNotFoundException
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 */
	public void manejarEvento(Evento evento) throws ClassNotFoundException, InstantiationException, IllegalAccessException{
		List<String> listeners = applicationContext.retrieveEventosForClass(evento.getClazz());
		Class<?> clase;
		Object instancia;
		EventListener listener;
		for (String currentListener : listeners) {
			clase = Class.forName(currentListener);
			instancia = clase.newInstance();
			listener=(EventListener) instancia;
			listener.setServiceRepository(serviceRepository);//autowired!
			listener.execute(evento);
		}
	}
}
