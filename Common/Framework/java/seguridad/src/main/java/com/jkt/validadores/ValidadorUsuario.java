package com.jkt.validadores;

import java.util.Set;

import com.jkt.dominio.EmpresaHabilitada;
import com.jkt.dominio.PersistentEntity;
import com.jkt.dominio.Usuario;
import com.jkt.excepcion.ValidacionException;

public class ValidadorUsuario implements IValidador {

	private static final String MENSAJE_ERROR = "Error al validar la entidad Usuario.";
	Usuario usuario;

	public void validar(PersistentEntity entity) throws ValidacionException {
		usuario = (Usuario) entity;
		Set<EmpresaHabilitada> empresasHabilitadas = usuario.getEmpresasHabilitadas();
		
		if (empresasHabilitadas.isEmpty()) {
			throw new ValidacionException(MENSAJE_ERROR);
		}
		
		int cantidadDeEmpresasDefault=0;
		for (EmpresaHabilitada empresaHabilitada : empresasHabilitadas) {
			if (empresaHabilitada.isPorDefecto()) {
				cantidadDeEmpresasDefault++;
			}
			if (cantidadDeEmpresasDefault>1) {
				throw new ValidacionException(MENSAJE_ERROR);
			}
		}
		if (cantidadDeEmpresasDefault!=1) {
			throw new ValidacionException(MENSAJE_ERROR);
		}
		
	}

}
