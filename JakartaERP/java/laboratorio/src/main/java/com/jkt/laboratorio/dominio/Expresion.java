package com.jkt.laboratorio.dominio;

import groovy.transform.EqualsAndHashCode;

import java.util.ArrayList;
import java.util.List;
import java.util.Observable;
import java.util.Observer;

import lombok.Data;
import net.sourceforge.jeval.EvaluationException;
import net.sourceforge.jeval.Evaluator;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.laboratorio.procesos.NotifyVariableResolver;

@Data
@EqualsAndHashCode(callSuper=true)
public class Expresion extends PersistentEntity  implements Observer  {
	private static final long serialVersionUID = 1L;

	private String expresion;
	
	private Variable variable;
	private List<Variable> variables = new ArrayList<Variable>();
	private List<String> variablesSimples = new ArrayList<String>();

	public void validar(String aValue) throws ValidacionDeNegocioException{
		Evaluator evaluator = new Evaluator();
		evaluator.getVariables();
		evaluator.setVariableResolver(new NotifyVariableResolver(this));
		try{
	 	   evaluator.evaluate(aValue);
		}
		catch (EvaluationException e){
			throw new ValidacionDeNegocioException(e.getMessage());
		}
	}
	
	public double calcular(){
	   return 0;	
	}

	public void update(Observable arg0, Object arg1) {
		String var = (String) arg1;
		if (! variablesSimples.contains(var)){
			variablesSimples.add(var);
		}
		
	}
}
