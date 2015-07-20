package com.jkt.laboratorio.operaciones;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import net.sourceforge.jeval.Evaluator;

import com.jkt.excepcion.JakartaException;
import com.jkt.laboratorio.dominio.Metodo;
import com.jkt.laboratorio.dominio.Variable;
import com.jkt.laboratorio.procesos.ExpresionVariableResolver;
import com.jkt.operaciones.Operation;

 public class CalcularExpresionesDeMetodo extends Operation {
	 
	 @Override
	 public void execute(Map<String, Object> aParams) throws Exception {
		 
		Metodo metodo =  (Metodo) aParams.get("objeto");
		
		List<Variable> variablesDeMetodo = metodo.getVariables();
		
		Evaluator evaluator = new Evaluator();
		Map<String, Variable> mapa= new HashMap<String, Variable>();

		Variable variableResultado = null;
		
		for (Variable variable : variablesDeMetodo) {
			
			if(variable.isResultadoFinal()){
				variableResultado = variable;
			}
			
			if(!variable.isInput()){
				variable.setExpresion(transformarExpresion(variable.getExpresion()));
			}
			mapa.put(variable.getCodigo(), variable); 
		}

		
		if(variableResultado==null){
			throw new JakartaException("Verifique que alguna de las variables esta tildada como resultado final.");
		}
		
		evaluator.setVariables(mapa);
		evaluator.setVariableResolver(new ExpresionVariableResolver(null , mapa));
		String evaluate = evaluator.evaluate(variableResultado.getExpresion());
		variableResultado.setValorInput(Double.valueOf(evaluate));
		
		notificarObjeto("", metodo);
	 }
	 
	 private String transformarExpresion(String exp) {

		List<String> operadores = new ArrayList<String>();
		String variablesYConstantes = "";

		for (int x = 0; x < exp.length(); x++) {
			switch (exp.codePointAt(x)) {
			case '+':
			case '-':
			case '*':
			case '/':
				String op = (new StringBuffer().append(exp.charAt(x))).toString();
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

	private String armarExpresion(String variablesYConstantes,List<String> operadores) {

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
