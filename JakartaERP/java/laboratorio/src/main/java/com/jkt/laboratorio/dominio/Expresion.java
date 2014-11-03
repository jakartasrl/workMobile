package com.jkt.laboratorio.dominio;

import java.util.ArrayList;
import java.util.List;
import java.util.Observable;
import java.util.Observer;

import net.sourceforge.jeval.EvaluationException;
import net.sourceforge.jeval.Evaluator;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ValidacionException;
import com.jkt.laboratorio.procesos.NotifyVariableResolver;

public class Expresion extends PersistentEntity  implements Observer  {
	private String expresion;
	private Metodo metodo;
	private List<String> variables = new ArrayList<String>();

	
	public Metodo getMetodo() {
		return metodo;
	}

	public void setMetodo(Metodo metodo) {
		this.metodo = metodo;
	}

	


	public String getExpresion() {
		return expresion;
	}

	public void setExpresion(String aValue) {
		this.expresion = aValue;
	}
	
	
	public void validar(String aValue) throws ValidacionException{
		Evaluator evaluator = new Evaluator();
		evaluator.setVariableResolver(new NotifyVariableResolver(this));
		
		try{
	 	   evaluator.evaluate(aValue);
		}
		catch (EvaluationException e){
			throw new ValidacionException(e.getMessage());
		}
	}
	
	public List<String> getVariables(){
		return variables;
	}
	
	public double calcular(){
	   return 0;	
	}

	public void update(Observable arg0, Object arg1) {
		String var = (String) arg1;
		if (! variables.contains(var)){
		       variables.add(var);
		}
		
	}
}
