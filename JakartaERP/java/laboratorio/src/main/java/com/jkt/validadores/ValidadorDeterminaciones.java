package com.jkt.validadores;

import java.util.ArrayList;
import java.util.List;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.laboratorio.dominio.Determinacion;
import com.jkt.laboratorio.dominio.Expresion;
import com.jkt.laboratorio.dominio.Metodo;
import com.jkt.laboratorio.dominio.Variable;
import com.jkt.operaciones.ValidacionDeNegocio;

public class ValidadorDeterminaciones extends ValidacionDeNegocio{

	public void validar(PersistentEntity entity) throws ValidacionDeNegocioException {
		
		Determinacion deter = (Determinacion) entity;
		if (deter.sinMetodos()){
			throw new ValidacionDeNegocioException("La determinacion debe tener al menos un metodo");		
		}
		
		for (Metodo metodo : deter.getMetodos()) { //por cada metodo...
			//y para cada variable del metodo...
			
			for (Variable variable : metodo.getVariables()) {
				if (!variable.isInput()) {
					//Se tiene que calcular la expresion...
					
					Expresion expresion = new Expresion();
					expresion.setExpresion(variable.getExpresionCadena());
					expresion.setVariable(variable);
					variable.setExpresion(expresion);
					
					expresion.validar(variable.getExpresionCadena());
					
//					List<Variable> variablesPrimitivas= new ArrayList<Variable>();
//					for (Variable varAux : variable.getVariables()) {
//						if (varAux.isInput()) {
//							variablesPrimitivas.add(varAux);
//						}
//					}
					
					//Hay q partir la expresion y validar que exista cada una de las variables definidas, en la lista de vars...
					
					
				}
			}
			//validar la exp
			
		}
		
//		if (deter.isCalculaResultado()){
//			verificarExistaExpresion(deter);
//		}

	}

//	private void verificarExistaExpresion(Determinacion aDeter)  throws ValidacionDeNegocioException{
//		Iterator<Metodo> it = aDeter.getMetodos().iterator();
//		while (it.hasNext()){
//			Metodo met = (Metodo) it.next();
//			if (met.sinExpresion()){
//				throw new ValidacionDeNegocioException("El Metodo: " + met.getMetodo() + " debe tener una expresion");
//			}
//		}
//		
//		
//	}

}
