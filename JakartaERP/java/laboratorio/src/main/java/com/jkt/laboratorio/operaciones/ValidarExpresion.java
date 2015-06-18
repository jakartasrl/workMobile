package com.jkt.laboratorio.operaciones;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.jkt.dominio.Descriptible;
import com.jkt.laboratorio.dominio.Expresion;
import com.jkt.operaciones.Operation;

public class ValidarExpresion extends Operation  {

	private static final String EXPRESION = "EXPRESION";

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		Expresion exp = new Expresion();
		String calc = (String) aParams.get(EXPRESION);
		exp.validar(calc); 
		List<String> variablesSimples = exp.getVariablesSimples();
		
		List<Descriptible> listaARetornar=new ArrayList<Descriptible>();
		for (String currentVar : variablesSimples) {
			Descriptible d = new Descriptible();
			d.setCodigo(currentVar);
			listaARetornar.add(d);
		}
		
		notificarObjeto("", listaARetornar);
	}   
	
}
