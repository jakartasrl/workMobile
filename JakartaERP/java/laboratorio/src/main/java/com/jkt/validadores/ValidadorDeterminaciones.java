package com.jkt.validadores;

import java.util.Iterator;

import com.jkt.dominio.PersistentEntity;
import com.jkt.excepcion.ValidacionDeNegocioException;
import com.jkt.laboratorio.dominio.Determinacion;
import com.jkt.laboratorio.dominio.Metodo;
import com.jkt.operaciones.ValidacionDeNegocio;

public class ValidadorDeterminaciones extends ValidacionDeNegocio{

	public void validar(PersistentEntity entity) throws ValidacionDeNegocioException {
//		Determinacion deter = (Determinacion) entity;
//		if (deter.sinMetodos()){
//			throw new ValidacionDeNegocioException("La determinacion debe tener al menos un metodo");		
//		}
//		
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
