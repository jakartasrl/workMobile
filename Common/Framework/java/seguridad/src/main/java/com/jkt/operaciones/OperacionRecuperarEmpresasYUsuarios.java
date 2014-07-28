package com.jkt.operaciones;

import java.util.List;
import java.util.Map;

import com.jkt.dominio.Empresa;
import com.jkt.dominio.PersistentEntity;
import com.jkt.dominio.Usuario;
import com.jkt.transformers.Notificacion;

public class OperacionRecuperarEmpresasYUsuarios extends Operation{

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		List<PersistentEntity> usuarios = serviceRepository.getByProperties(Usuario.class, null);
		List<PersistentEntity> empresas = serviceRepository.getByProperties(Empresa.class, null);

		//Una vez recuperadas todas las entidades notifico
		for (PersistentEntity persistentEntity : empresas) {
			notificarObjecto(Notificacion.getNew("TEmpresas", persistentEntity));
		}

		for (PersistentEntity persistentEntity : usuarios) {
			notificarObjecto(Notificacion.getNew("TUsuarios", persistentEntity));
		}
		
		
	}

}
