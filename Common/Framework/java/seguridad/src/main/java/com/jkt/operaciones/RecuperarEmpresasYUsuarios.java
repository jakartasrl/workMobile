package com.jkt.operaciones;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.jkt.dominio.Empresa;
import com.jkt.dominio.EmpresaHabilitada;
import com.jkt.dominio.PersistentEntity;
import com.jkt.dominio.Usuario;
import com.jkt.transformers.Notificacion;

public class RecuperarEmpresasYUsuarios extends Operation{

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		List<PersistentEntity> usuarios = serviceRepository.getByProperties(Usuario.class, null);

		for (PersistentEntity usuario : usuarios) {
			notificarObjecto(Notificacion.getNew("TUsuarios", usuario));
		
			Usuario auxUsuario=(Usuario) usuario;
			for (EmpresaHabilitada empresaHabilitada : auxUsuario.getEmpresasHabilitadas()) {
				PersistentEntity uniqueByProperty = serviceRepository.getUniqueByProperty(empresaHabilitada.getClass(), "id", empresaHabilitada.getId());
				notificarObjecto(Notificacion.getNew("TUsuarioEmpresas", uniqueByProperty));
			}
		}
		
	}

}
