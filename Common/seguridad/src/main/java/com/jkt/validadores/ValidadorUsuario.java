package com.jkt.validadores;

import java.util.Set;

import com.jkt.dominio.EmpresaHabilitada;
import com.jkt.dominio.PersistentEntity;
import com.jkt.dominio.Usuario;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.operaciones.ValidacionDeNegocio;

/**
 * <p>Regla de negocio en cuanto al usuario y las empresas habilitadas y por defecto.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ValidadorUsuario extends ValidacionDeNegocio {

	private static final String MENSAJE_ERROR_EMPRESAS_VACIAS = "El usuario no tiene ninguna empresa habilitada.";
	private static final String MENSAJE_ERROR_EMPRESA_DEFAULT = "Error al guardar. El usuario debe tener una, y solo una, empresa por defecto.";
	Usuario usuario;

	public void validar(PersistentEntity entity) throws ValidacionDeNegocioException {
		usuario = (Usuario) entity;
		Set<EmpresaHabilitada> empresasHabilitadas = usuario.getEmpresasHabilitadas();
		
		if (empresasHabilitadas.isEmpty()) {
			throw new ValidacionDeNegocioException(MENSAJE_ERROR_EMPRESAS_VACIAS);
		}
		
		int cantidadDeEmpresasDefault=0;
		for (EmpresaHabilitada empresaHabilitada : empresasHabilitadas) {
			if (empresaHabilitada.isPorDefecto()) {
				cantidadDeEmpresasDefault++;
			}
			if (cantidadDeEmpresasDefault>1) {
				throw new ValidacionDeNegocioException(MENSAJE_ERROR_EMPRESA_DEFAULT);
			}
		}
		if (cantidadDeEmpresasDefault!=1) {
			throw new ValidacionDeNegocioException(MENSAJE_ERROR_EMPRESA_DEFAULT);
		}
		
	}

}
