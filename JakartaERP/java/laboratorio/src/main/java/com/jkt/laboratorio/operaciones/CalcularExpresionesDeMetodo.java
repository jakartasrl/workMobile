package com.jkt.laboratorio.operaciones;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import net.sourceforge.jeval.Evaluator;

import com.jkt.laboratorio.dominio.Metodo;
import com.jkt.laboratorio.dominio.Variable;
import com.jkt.operaciones.Operation;

 public class CalcularExpresionesDeMetodo extends Operation {
	 
	 private static final String OID = "oid".toUpperCase();

	 @Override
	 public void execute(Map<String, Object> aParams) throws Exception {
		 
		Metodo metodo =  (Metodo) aParams.get("objeto");
		
		List<Variable> variablesComplejas = new ArrayList<Variable>();
		List<Variable> variablesSimples = new ArrayList<Variable>();

		Evaluator evaluator = new Evaluator();
		Map<String, String> mapa= new HashMap<String, String>();
		
		for (Variable variable : metodo.getVariables()) {
			if (variable.isInput()) {
				mapa.put(variable.getCodigo(), String.valueOf(variable.getValorInput())); //TODO cambiar a var valor
				variablesSimples.add(variable);
			} else {
				variablesComplejas.add(variable);
			}
		}

		evaluator.setVariables(mapa);

		for (Variable variable : variablesComplejas) {

			String expresion = transformarExpresion(variable.getExpresion());
			//en expresion tengo #{A}+#{BEDF} 
			
			double resultado = evaluator.getNumberResult(expresion);
			variable.setResultadoExpresion(resultado);

		}
		
		metodo.setVariables(new ArrayList<Variable>());
//		metodo.getVariables().addAll(variablesSimples);
		metodo.getVariables().addAll(variablesComplejas);
		
		notificarObjeto("", metodo);
		
	 }

	// TODO helper for labs ops
	private String transformarExpresion(String exp) {

		List<String> operadores = new ArrayList<String>();
		String variablesYConstantes = "";

		for (int x = 0; x < exp.length(); x++) {
			switch (exp.codePointAt(x)) {
			case '+':
			case '-':
			case '*':
			case '/':
				String op = (new StringBuffer().append(exp.charAt(x)))
						.toString();
				operadores.add(op);
				break;
			default:
				break;
			}

		}

		StringTokenizer tokens = new StringTokenizer(exp, " +-*/");
		while (tokens.hasMoreTokens()) {
			String currentToken = tokens.nextToken();
			if (!this.esNumero(currentToken)) {
				variablesYConstantes += "#{" + currentToken + "}" + "|";
			} else {
				variablesYConstantes += currentToken;
			}
		}

		return this.armarExpresion(variablesYConstantes, operadores);

	}

	private String armarExpresion(String variablesYConstantes,
			List<String> operadores) {

		String result = "";
		int i = 0;
		StringTokenizer tokens = new StringTokenizer(variablesYConstantes, "|");
		while (tokens.hasMoreTokens()) {
			String currentToken = tokens.nextToken();
			if (tokens.hasMoreTokens()) {
				result += currentToken + operadores.get(i++);
			} else {
				result += currentToken;
			}
		}

		return result;

	}

	private boolean esNumero(String cadena) {
		try {
			Integer.parseInt(cadena);
			return true;
		} catch (NumberFormatException nfe) {
			return false;
		}

	}

}
