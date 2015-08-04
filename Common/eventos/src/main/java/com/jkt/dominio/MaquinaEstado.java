package com.jkt.dominio;

import java.util.LinkedList;
import java.util.List;

import com.jkt.excepcion.JakartaException;

/**
 * Administra la lista de estados disponibles, ofrece metodos para avanzar y retroceder estados
 * 
 * @author Leonel Suarez - Jakarta SRL
 *
 */
@SuppressWarnings("serial")
public class MaquinaEstado extends PersistentEntity {

	private List<Estado> estados = new LinkedList<Estado>();
	
	public void agregarEstado(Estado e){
		this.estados.add(e);
	}

	public void eliminarEstado(Estado e){
		this.estados.remove(e);
	}
	
	public boolean estaEnElFinal(Estado estado) throws JakartaException{
		
		validarConsistencia();
		
		Estado estadoFinal = estados.get(estados.size()-1);
		return estado==estadoFinal;
	}

	public boolean estaEnElInicio(Estado estado) throws JakartaException{
		validarConsistencia();
		
		int indice = getIndice(estado);
		return indice==0;
	}
	
	/**
	 * Toda maquina de estados debera tener como minimo un estado.
	 */
	private void validarConsistencia() throws JakartaException{
		if(estados.isEmpty()){
			throw new JakartaException("Inconsistencia. La maquina de estados debe tener aun que sea un estado.");
		}
	}
	
	public Estado siguiente(Estado estadoActual) throws JakartaException{
		if(estaEnElFinal(estadoActual)){
			throw new JakartaException("El estado actual es el final.");
		}else{
			int indice = getIndice(estadoActual);
			return estados.get(indice+1);
		}
	}
	
	public Estado anterior(Estado estadoActual) throws JakartaException{
		int indice = getIndice(estadoActual);
		if(indice==0){
			throw new JakartaException("Esta en el estado inicial");
		}else{
			return estados.get(indice-1);
		}
	}
	
	/**
	 * Dado un estado, se retorna el indice para poder moverme en la lista.
	 */
	private int getIndice(Estado estado) throws JakartaException{
		int i=0;
		for (Estado estadoActual : estados) {
			if(estadoActual==estado){
				return i;
			}else{
				i++;
			}
		}
		throw new JakartaException("No existe el estado indicado.");
	}
	
}
