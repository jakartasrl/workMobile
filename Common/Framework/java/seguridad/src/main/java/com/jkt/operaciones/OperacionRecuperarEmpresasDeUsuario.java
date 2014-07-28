package com.jkt.operaciones;

import java.util.Map;

import com.jkt.dominio.Empresa;
import com.jkt.dominio.Usuario;
import com.jkt.excepcion.EntityNotFoundException;
import com.jkt.excepcion.JakartaException;
import com.jkt.transformers.Notificacion;

public class OperacionRecuperarEmpresasDeUsuario extends Operation {

	private static final String OID_USUARIO = "oid_usuario";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		String oidUsuario=(String) aParams.get(OID_USUARIO);
		if (oidUsuario==null || oidUsuario.isEmpty()) {
			throw new JakartaException(String.format("Debe ingresar el parametro denominado %s para poder realizar exitosamente la operacion.",OID_USUARIO));
		}
		Usuario usuario = (Usuario) serviceRepository.getByOid(Usuario.class, Long.valueOf(oidUsuario));
		if (usuario==null) {
			throw new EntityNotFoundException("No existe la entidad solicitada");
		}
		
		//Luego de encontrar la entidad usuario, debo notificar la misma y tambien la lista de empresas...
		notificarObjecto(Notificacion.getNew("TUsuario", usuario));
		
		long idUsuario = usuario.getId();
		for (Empresa empresa : usuario.getEmpresasPermitidas()) {
			empresa.setOidUsuario(String.valueOf(idUsuario));
			notificarObjecto(Notificacion.getNew("TEmpresas", empresa));
		}
		
		
	}

}
