package com.jkt.cotizador.operaciones;

import java.util.Map;

import com.jkt.cotizador.dominio.ConceptoPresupuesto;
import com.jkt.operaciones.Operation;

public class TraerConceptoPresupuesto extends Operation {
	
	private static final String OID = "OID";
	
	public void execute(Map<String, Object> aParams) throws Exception {
		
		ConceptoPresupuesto conceptoPresupuesto = (ConceptoPresupuesto) obtener(ConceptoPresupuesto.class, (String)aParams.get(OID));
		notificarObjeto("", conceptoPresupuesto);
	
	}

}
