package com.jkt.operaciones;

import org.springframework.beans.factory.annotation.Autowired;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ReglaDeNegocioException;
import com.jkt.persistencia.IServiceRepository;
import com.jkt.reglas.IReglasDeNegocio;

/**
 * <p>Ejecuta una regla de negocio.</p>
 * <p>Esta regla esta en un contexto transaccional, con lo cu�l puede realizar operaciones sobre la base de datos.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public abstract class ReglaDeNegocio implements IReglasDeNegocio {
	
	protected IServiceRepository serviceRepository;

	public IServiceRepository getServiceRepository() {
		return serviceRepository;
	}

	@Autowired
	public void setServiceRepository(IServiceRepository serviceRepository) {
		this.serviceRepository = serviceRepository;
	}

}
