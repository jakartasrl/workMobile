package com.jkt.laboratorio.procesos;

import java.util.Collection;
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

				Collection<Variable> values = this.variablesDisponibles.values();
				for (Variable variable2 : values) {
					Evaluator evaluator = new Evaluator();
					evaluator.setVariables(this.variablesDisponibles);
					evaluator.setVariableResolver(new ExpresionVariableResolver(null , this.variablesDisponibles));
					String resultado = evaluator.getVariableValue(variable2.getCodigo());
//					this.variablesDisponibles.put(variable2.getCodigo(), resultado);
				}
				
				Evaluator evaluator = new Evaluator();
				evaluator.setVariables(this.variablesDisponibles);
				evaluator.setVariableResolver(new ExpresionVariableResolver(null , this.variablesDisponibles));
				return evaluator.getVariableValue(variable.getCodigo());
				
			} catch (EvaluationException e) {
				e.printStackTrace();
			}
		}
		return "0";
		
	}

}
