package com.jkt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jkt.dominio.PersistentEntity;

@Component
public class Factory {

	@Autowired
	static private ServiceRepository serviceRepository;

	private static final String CODIGO2 = "codigo";
	
	public static PersistentEntity getInstance(Class className, String codigo){
		PersistentEntity instanciaRecuperada = serviceRepository.getUniqueByProperty(className, CODIGO2, codigo);
		if (instanciaRecuperada==null) {
//			instanciaRecuperada=
		}
		return null;
		
	}
	
}
