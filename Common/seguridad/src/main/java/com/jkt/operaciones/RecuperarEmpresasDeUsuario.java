package com.jkt.operaciones;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.Empresa;
import com.jkt.dominio.EmpresaHabilitada;
import com.jkt.dominio.PersistentEntity;
import com.jkt.dominio.Usuario;
import com.jkt.excepcion.EntityNotFoundException;
import com.jkt.excepcion.JakartaException;

public class RecuperarEmpresasDeUsuario extends Operation {

	private static final String OID_USUARIO = "oid_usuario".toUpperCase();

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {

		String oidUsuario=(String) aParams.get(OID_USUARIO);
		List<PersistentEntity> empresas = serviceRepository.getAll(Empresa.class);
		Empresa empresa;
		
		if (oidUsuario==null || oidUsuario.isEmpty()) {
			throw new JakartaException(String.format("Debe ingresar el parametro denominado %s para poder realizar exitosamente la operacion.",OID_USUARIO));
		}
		Usuario usuario = (Usuario)obtener(Usuario.class, oidUsuario);
		if (usuario==null) {
			throw new EntityNotFoundException("No existe la entidad solicitada");
		}
		
		//Luego de encontrar la entidad usuario, debo notificar la misma y tambien la lista de empresas...
		notificarObjecto("TUsuario", usuario);
		
		List listaDeIds=new ArrayList();
		for (EmpresaHabilitada empresaHabilitada : usuario.getEmpresasHabilitadas()) {
			PersistentEntity uniqueByProperty = serviceRepository.getUniqueByProperty(empresaHabilitada.getClass(), "id", empresaHabilitada.getId());
			Empresa e=((EmpresaHabilitada)uniqueByProperty).getEmpresa();
			if (e.isActivo()) {
				notificarObjecto("TUsuarioEmpresas", uniqueByProperty);
				long id = e.getId();
				listaDeIds.add(id);
			}
		}
		
		
		//Si se crearon nuevas empresas, el usuario no las posee como habilitadas o inhabilitadas, entonces tambien envio las empresas nuevas.
		//(Se excluyen del total de las empresas, las dadas de baja(baja logica) y las que ya las tiene el usuario en la lista de habilitadas)
		//resumen: Se muestran tambien las empresas activas y no habilitadas
		for (PersistentEntity currentObject : empresas) {
			empresa=(Empresa) currentObject;
			
			//Si la empresa esta activa y no esta en la lista de contenidos como empresas permitida, lo agrego.
			if (empresa.isActivo() && !listaDeIds.contains(empresa.getId())) {
				EmpresaHabilitada empresaHabilitada = new EmpresaHabilitada();
				empresaHabilitada.setId(0L);
				empresaHabilitada.setUsuario(usuario);
				empresaHabilitada.setEmpresa(empresa);
				notificarObjecto("TUsuarioEmpresas", empresaHabilitada);
			}
		}
		
	}

}
