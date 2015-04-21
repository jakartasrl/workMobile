package com.jkt.laboratorio.dominio;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Observable;
import java.util.Observer;

import lombok.Data;
import net.sourceforge.jeval.EvaluationException;
import net.sourceforge.jeval.Evaluator;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.laboratorio.procesos.NotifyVariableResolver;

@Data
public class Expresion extends PersistentEntity  implements Observer  {
	private String expresion;
//	private Metodo metodo;
	
	private Variable variable;
	private List<Variable> variables = new ArrayList<Variable>();

	
//	public Metodo getMetodo() {
//		return metodo;
//	}
//
//	public void setMetodo(Metodo metodo) {
//		this.metodo = metodo;
//	}

	


	public String getExpresion() {
		return expresion;
	}

	public void setExpresion(String aValue) {
		this.expresion = aValue;
	}
	
	
	public void validar(String aValue) throws ValidacionDeNegocioException{
		Evaluator evaluator = new Evaluator();
		
		evaluator.getVariables();
		
		Map vars=new HashMap();
		vars.put("A", 10);
		vars.put("B", 10);
		vars.put("C", 10);
		vars.put("D", 10);
		evaluator.setVariables(vars);
		
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
//		String var = (String) arg1;
//		if (! variables.contains(var)){
//		       variables.add(var);
//		}
		
	}
}
