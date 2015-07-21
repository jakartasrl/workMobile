package com.jkt.validadores;

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
		if (deter.getMetodos().isEmpty()){
			throw new ValidacionDeNegocioException("La determinación debe tener al menos un metodo");		
		}
		
		for (Metodo metodo : deter.getMetodos()) { //por cada metodo...
			//y para cada variable del metodo...
			
			for (Variable variable : metodo.getVariables()) {
				if (!variable.isInput()) {
					//Se tiene que calcular la expresion...
					Expresion expresion = new Expresion();
					expresion.setExpresion(variable.getExpresion());
					expresion.setVariable(variable);
					
				}
			}

		}
		
	}

}
