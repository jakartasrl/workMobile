package com.jkt.helper.numerador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jkt.service.ServiceRepository;

@Service("HelperNumerador")
public class HelperNumerador {

	@Autowired
	private ServiceRepository service;

	public ServiceRepository getService() {
		return service;
	}

	public void setService(ServiceRepository service) {
		this.service = service;
	}

	public HelperNumerador() {
		System.out.println();
	}
	
	public Object retornarAlgo(){
		return this.service;
	}
}