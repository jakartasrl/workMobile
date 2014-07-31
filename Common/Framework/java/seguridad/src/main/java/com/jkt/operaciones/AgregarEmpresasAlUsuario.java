package com.jkt.operaciones;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.Empresa;
import com.jkt.dominio.EmpresaHabilitada;
import com.jkt.dominio.PersistentEntity;
import com.jkt.dominio.Usuario;

@OperacionBean
public class AgregarEmpresasAlUsuario extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		List objetos = recuperarObjeto(aParams);
		Usuario usuario;
		for (Object object : objetos) {
			usuario=(Usuario) object;
			
			usuario.getEmpresasHabilitadas().clear();	//FIXME Cuando tengan el filtro, lo que vamos a hacer es usar el OID,
														//y no se generarán nuevas instancias, sino que siempre será actualizacion.
			
			List<EmpresaHabilitada> empresasHabilitadasPlanas = usuario.getEmpresasHabilitadasPlanas();//Uso los campos planchados para recuperar desde la base
			for (EmpresaHabilitada empresaHabilitada : empresasHabilitadasPlanas) {
				Empresa empresa = (Empresa) serviceRepository.getUniqueByProperty(Empresa.class, "id", Long.valueOf(empresaHabilitada.getOidEmpresa()));
				
				EmpresaHabilitada empresaAGuardarEnUsuario = new EmpresaHabilitada();
				empresaAGuardarEnUsuario.setUsuario(usuario);
				empresaAGuardarEnUsuario.setEmpresa(empresa);
				empresaAGuardarEnUsuario.setHabilitada(empresaHabilitada.isHabilitada());
				empresaAGuardarEnUsuario.setPorDefecto(empresaHabilitada.isPorDefecto());
				
				usuario.agregarEmpresaHabilitada(empresaAGuardarEnUsuario);
			}
			serviceRepository.save(usuario);
		}

	}

	
	private List recuperarObjeto(Map<String, Object> aParams) {
		List object;
		if (aParams.get("objeto")  instanceof List) {
			object = (List) aParams.get("objeto");
		}else{
			object = new ArrayList<Object>();
			object.add(aParams.get("objeto"));
		}
		return object;
	}
	
}
