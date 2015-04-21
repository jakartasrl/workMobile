package com.jkt.laboratorio.operaciones;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.jkt.laboratorio.dominio.Metodo;
import com.jkt.laboratorio.dominio.ValorEsperado;
import com.jkt.operaciones.Operation;

public class TraerValoresEsperados extends Operation {

	private static final String OID = "oid".toUpperCase();

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		
		validarEntrada(aParams.get(OID));
		
		Metodo metodo = (Metodo) obtener(Metodo.class, (String) aParams.get(OID));
		List<ValorEsperado> valoresEsperados = new ArrayList<ValorEsperado>();
		
		for (ValorEsperado valorEsperado : metodo.getValoresEsperados()) {			
			valoresEsperados.add(valorEsperado); 
		}
		
		notificarObjeto("", valoresEsperados);
		
	}

}
