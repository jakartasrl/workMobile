package com.jkt.eventos;

import org.springframework.beans.factory.annotation.Autowired;

import com.jkt.persistencia.IServiceRepository;
import com.jkt.service.ServiceRepository;

/**
 * Listener para todas las operaciones que deseen ser ejecutadas luego de algun
 * evento de persistencia.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
abstract public class EventListener {

	private IServiceRepository serviceRepository;

	/**
	 * Ejecuta una acción con respecto al evento recibido.
	 * Recuerde que la acción puede contener operaciones contra la base de datos, y que ademas son transaccionales, siempre
	 * y cuando se utilice {@link ServiceRepository}, el cual puede tomar ejecutando el metodo {@link #getServiceRepository()}
	 * 
	 * 
	 * @param evento que contiene la clase, y el parametro pasado
	 */
	abstract public void execute(Evento evento);

	/**
	 * Retorna una instanciad e {@link ServiceRepository} para poder interactuar contra la base de datos
	 * 
	 * @return {@link ServiceRepository}
	 */
	public IServiceRepository getServiceRepository() {
		return serviceRepository;
	}

	
	/**
	 * setter way IoC
	 * 
	 * @param serviceRepository
	 */
	@Autowired
	public void setServiceRepository(IServiceRepository serviceRepository) {
		this.serviceRepository = serviceRepository;
	}
}
