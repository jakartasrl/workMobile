package com.jkt.operaciones;

import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.Empresa;
import com.jkt.dominio.EmpresaHabilitada;
import com.jkt.dominio.PersistentEntity;
import com.jkt.transformers.Notificacion;

@OperacionBean
public class TraerEmpresasParaUsuarios extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		List<PersistentEntity> empresas = serviceRepository.getAll(Empresa.class);
		Empresa emp;
		for (PersistentEntity persistentEntity : empresas) {
			emp=(Empresa) persistentEntity;
			EmpresaHabilitada empresaHabilitada = new EmpresaHabilitada();
			empresaHabilitada.setEmpresa(emp);
			empresaHabilitada.setOidEmpresa(String.valueOf(persistentEntity.getId()));
			notificarObjecto(Notificacion.getNew("TUsuarioEmpresas", empresaHabilitada));
		}
		
		
	}

}
