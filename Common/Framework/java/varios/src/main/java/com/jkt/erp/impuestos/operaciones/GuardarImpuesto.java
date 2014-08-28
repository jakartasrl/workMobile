package com.jkt.erp.impuestos.operaciones;

import java.util.Map;

import com.jkt.annotations.OperacionBean;
import com.jkt.operaciones.Operation;
import com.jkt.varios.dominio.Pais;

@OperacionBean
public class GuardarImpuesto extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		Pais p = new Pais();
		p.setDescripcion("Un pais furioso");
		this.serviceRepository.save(p);
	}

}
