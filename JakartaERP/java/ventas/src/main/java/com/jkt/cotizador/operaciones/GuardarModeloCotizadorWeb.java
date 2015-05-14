package com.jkt.cotizador.operaciones;

import java.util.Map;

import com.jkt.cotizador.dominio.ModeloCotizador;
import com.jkt.operaciones.Operation;

public class GuardarModeloCotizadorWeb extends Operation {
	
	private static final String KEY_OBJECT = "modelo";
	
	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		ModeloCotizador modelo = (ModeloCotizador) aParams.get(KEY_OBJECT);
		
		guardar(modelo);

	}
	
}
