package com.jkt.operaciones;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.collections.Closure;
import org.apache.commons.collections.CollectionUtils;

import com.jkt.dominio.Empresa;
import com.jkt.dominio.PersistentEntity;
import com.jkt.dominio.Usuario;
import com.jkt.dominio.UsuarioEmpresa;
import com.jkt.transformers.Notificacion;

public class RecuperarEmpresasYUsuarios extends Operation{

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		List<PersistentEntity> usuarios = serviceRepository.getByProperties(Usuario.class, null);
		List<PersistentEntity> empresas = serviceRepository.getByProperties(Empresa.class, null);

		for (PersistentEntity usuario : usuarios) {
			notificarObjecto(Notificacion.getNew("TUsuarios", usuario));
		
			UsuarioEmpresa usuarioEmpresa;
			Empresa auxEmpresa;
			Usuario auxUsuario=(Usuario) usuario;
			Set<Empresa> empresasPermitidas = auxUsuario.getEmpresasPermitidas();

			final List<Long> listaDePermitidos=new ArrayList<Long>();
			CollectionUtils.forAllDo(empresasPermitidas, new Closure() {
				
				Empresa e;
				
				public void execute(Object input) {
					e=(Empresa) input;
					listaDePermitidos.add(e.getId());
				}
			});
			
			long idUsuario = usuario.getId();
			
			for (PersistentEntity empresa : empresas) {
				auxEmpresa=(Empresa)empresa;
				
				usuarioEmpresa = new UsuarioEmpresa();
				usuarioEmpresa.setCodigo(auxEmpresa.getCodigo());
				usuarioEmpresa.setOidUsuario(String.valueOf(idUsuario));
				usuarioEmpresa.setRazonSocial(auxEmpresa.getRazonSocial());
				usuarioEmpresa.setOidEmpresa(String.valueOf(auxEmpresa.getId()));
				
				if (listaDePermitidos.contains(auxEmpresa.getId())) {
					usuarioEmpresa.setActivo(true);
				}else{
					usuarioEmpresa.setActivo(false);
				}
				notificarObjecto(Notificacion.getNew("TUsuarioEmpresas", usuarioEmpresa));
			}
		
		}
		
	}

}
