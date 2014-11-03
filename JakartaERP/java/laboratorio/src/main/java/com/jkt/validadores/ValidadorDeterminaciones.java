package com.jkt.validadores;

import java.util.Iterator;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ValidacionException;
import com.jkt.laboratorio.dominio.Determinacion;
import com.jkt.laboratorio.dominio.Metodo;

public class ValidadorDeterminaciones implements IValidador {

	public void validar(PersistentEntity entity) throws ValidacionException {
		Determinacion deter = (Determinacion) entity;
		if (deter.sinMetodos()){
			throw new ValidacionException("La determinacion debe tener al menos un metodo");		
		}
		
		if (deter.isCalculaResultado()){
			verificarExistaExpresion(deter);
		}

	}

	private void verificarExistaExpresion(Determinacion aDeter)  throws ValidacionException{
		Iterator<Metodo> it = aDeter.getMetodos().iterator();
		while (it.hasNext()){
			Metodo met = (Metodo) it.next();
			if (met.sinExpresion()){
				throw new ValidacionException("El Metodo: " + met.getMetodo() + " debe tener una expresion");
			}
		}
		
		
	}

}
