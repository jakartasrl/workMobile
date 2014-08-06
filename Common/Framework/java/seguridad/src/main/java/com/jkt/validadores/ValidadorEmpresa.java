package com.jkt.validadores;

import com.jkt.dominio.Empresa;
import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ValidacionException;

public class ValidadorEmpresa implements IValidador{

	public void validar(PersistentEntity entity) throws ValidacionException {
		Empresa e=(Empresa) entity;
		
	}

}
