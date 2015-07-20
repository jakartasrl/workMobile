package com.jkt.laboratorio.procesos;

import java.util.HashMap;
import java.util.Map;
import java.util.Observable;
import java.util.Observer;

import lombok.Data;
import net.sourceforge.jeval.EvaluationException;
import net.sourceforge.jeval.Evaluator;
import net.sourceforge.jeval.VariableResolver;
import net.sourceforge.jeval.function.FunctionException;

import com.jkt.laboratorio.dominio.Variable;

/**
 * Resuelve el valor de una variable, sea compuesta o simple.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class ExpresionVariableResolver extends Observable implements VariableResolver {

	private Observer obs;
	private Map<String, Variable> variablesDisponibles;
	
	public ExpresionVariableResolver(Observer aObs, Map<String, Variable> map){
	   obs = aObs;	
	   this.variablesDisponibles = map;
	}
	
	public String resolveVariable(String arg0) throws FunctionException {
		
		Variable variable = this.variablesDisponibles.get(arg0);
		if(variable.isInput()){
			return String.valueOf(variable.getValorInput());
		}else{
			
			try {
					
				Evaluator evaluator = new Evaluator();
				Map<String, Variable> mapa= new HashMap<String, Variable>();
				mapa.putAll(this.variablesDisponibles);
	
				evaluator.setVariables(mapa);
				evaluator.setVariableResolver(new ExpresionVariableResolver(null , mapa));
				String resultado = evaluator.evaluate(variable.getExpresion());
				variable.setValorInput(Double.valueOf(resultado));
				return resultado;
			} catch (EvaluationException e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}

	}

}
