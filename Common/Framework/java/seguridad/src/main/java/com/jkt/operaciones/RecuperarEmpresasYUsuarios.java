package com.jkt.operaciones;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.Empresa;
import com.jkt.dominio.EmpresaHabilitada;
import com.jkt.dominio.PersistentEntity;
import com.jkt.dominio.Usuario;
import com.jkt.transformers.Notificacion;

/**
 * Recupera todos los usuarios y para cada uno, todas las empresas y su relacion, es decir, permitida o no permitida.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class RecuperarEmpresasYUsuarios extends Operation{

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		List<PersistentEntity> usuarios = serviceRepository.getByProperties(Usuario.class, null);
		List<PersistentEntity> empresas = serviceRepository.getAll(Empresa.class);
		Empresa empresa;
		
		for (PersistentEntity usuario : usuarios) {
			notificarObjecto(Notificacion.getNew("TUsuarios", usuario));
		
			Usuario auxUsuario=(Usuario) usuario;
			List listaDeIds=new ArrayList();
			for (EmpresaHabilitada empresaHabilitada : auxUsuario.getEmpresasHabilitadas()) {
				PersistentEntity uniqueByProperty = serviceRepository.getUniqueByProperty(empresaHabilitada.getClass(), "id", empresaHabilitada.getId());
				Empresa e=((EmpresaHabilitada)uniqueByProperty).getEmpresa();
				if (e.isActivo()) {
					notificarObjecto(Notificacion.getNew("TUsuarioEmpresas", uniqueByProperty));
					long id = e.getId();
					listaDeIds.add(id);
				}
			}
			
			for (PersistentEntity currentObject : empresas) {
				empresa=(Empresa) currentObject;
				
				//Si la empresa esta activa y no esta en la lista de contenidos como empresas permitida, lo agrego.
				if (empresa.isActivo() && !listaDeIds.contains(empresa.getId())) {
					EmpresaHabilitada empresaHabilitada = new EmpresaHabilitada();
					empresaHabilitada.setId(0L);
					empresaHabilitada.setUsuario(auxUsuario);
					empresaHabilitada.setEmpresa(empresa);
					notificarObjecto(Notificacion.getNew("TUsuarioEmpresas", empresaHabilitada));
				}
			}
			
		}
	}

}
