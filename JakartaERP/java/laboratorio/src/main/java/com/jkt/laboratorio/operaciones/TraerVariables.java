package com.jkt.laboratorio.operaciones;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.jkt.laboratorio.dominio.Metodo;
import com.jkt.laboratorio.dominio.Variable;
import com.jkt.operaciones.Operation;

public class TraerVariables extends Operation  {
	
	private static final String OID = "oid".toUpperCase();

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {

		validarEntrada(aParams.get(OID));

		Metodo metodo = (Metodo) obtener(Metodo.class, (String) aParams.get(OID));		
		List<Variable> variables = new ArrayList<Variable>();
		
		for (Variable variable : metodo.getVariables()) {			
			variables.add(variable); 
		}
		
		notificarObjeto("", variables);
		
	}

}
