package com.jkt.erp.impuestos.dominio;

import java.util.ArrayList;
import java.util.List;

import com.jkt.excepcion.JakartaException;

public class FactoryImpuestos {

	static public Impuesto resolverImpuesto(ImpuestoDTO dto) throws JakartaException{
		
		Impuesto i = null;
		String comportamiento = dto.getComportamiento();
		if (comportamiento.equals("GANANCIAS")) {
			i=new Ganancias();
			
		}else if(comportamiento.equals("IIBB")){
			i=new IngresosBrutos();
		}else if(comportamiento.equals("IVA")){
			i=new Iva();
		}else if(comportamiento.equals("SUSS")){
			i=new SUSS();
		}else{
			throw new JakartaException("Es inconsistente el tipo de impuesto solicitado.");
		}
		return i;
		
		
	}
	
	
}
