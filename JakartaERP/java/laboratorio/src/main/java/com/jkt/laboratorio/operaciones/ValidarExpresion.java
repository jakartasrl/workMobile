package com.jkt.laboratorio.operaciones;

import java.util.Iterator;
import java.util.Map;

import com.jkt.laboratorio.dominio.Expresion;
import com.jkt.operaciones.Operation;

public class ValidarExpresion extends Operation  {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		Expresion exp = new Expresion();
		String calc = (String) aParams.get("EXPRESION");
		exp.validar(calc); 
		Iterator<String> it = exp.getVariables().iterator();
		while (it.hasNext()){
			String var = (String) it.next();
			notificarObjeto("resultado", new Wrk(var));
		}
	}   
	
	public class Wrk {
		private String codigo;
		
		public Wrk(String aValue){
			codigo = aValue;
		}
		
		public String getCodigo(){
			return codigo;
		}
	}

	

}
