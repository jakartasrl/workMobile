package com.jkt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jkt.dominio.PersistentEntity;

/**
 * Clase que se encarga de retornar una instancia de la clase recibida por parametros, 
 * desde la base, o en su defecto, desde memoria(Nueva instancia)
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Component
public class Factory {

	@Autowired
	static private ServiceRepository serviceRepository;

	private static final String CODIGO = "codigo";
	
	public static PersistentEntity getInstance(Class className, String codigo) throws InstantiationException, IllegalAccessException{
		if (codigo==null || codigo.isEmpty()) {
			return (PersistentEntity) className.newInstance();
		}
		
		PersistentEntity instanciaRecuperada = serviceRepository.getUniqueByProperty(className, CODIGO, codigo);
		

		
		if (instanciaRecuperada==null) {
			instanciaRecuperada = (PersistentEntity) className.newInstance();
		}
		return instanciaRecuperada;
	}

}
