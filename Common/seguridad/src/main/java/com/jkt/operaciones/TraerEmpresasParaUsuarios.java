package com.jkt.operaciones;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.jkt.annotations.OperacionBean;
import com.jkt.dominio.Empresa;
import com.jkt.dominio.EmpresaHabilitada;
import com.jkt.dominio.Filtro;
import com.jkt.dominio.PersistentEntity;

@OperacionBean
public class TraerEmpresasParaUsuarios extends Operation {

	private static final String ACTIVO = "activo";
	private static final String VALUE = "true";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
//		List<PersistentEntity> empresas = serviceRepository.getAll(Empresa.class);
		
		Filtro f = new Filtro();
		f.setCondicion("igual");
		f.setValor("true");
		f.setNombre("activo");
		f.setTipoDeDato("boolean");
		
		List<PersistentEntity> empresas = serviceRepository.getByProperties(Empresa.class, Arrays.asList(f));//(Empresa.class, ACTIVO, VALUE);// getAll(Empresa.class);
		Empresa empresa;
		for (PersistentEntity persistentEntity : empresas) {
			empresa=(Empresa) persistentEntity;
			EmpresaHabilitada empresaHabilitada = new EmpresaHabilitada();
			empresaHabilitada.setEmpresa(empresa);
			empresaHabilitada.setOidEmpresa(String.valueOf(persistentEntity.getId()));
			notificarObjecto("resultado", empresaHabilitada);
		}
	}

}
