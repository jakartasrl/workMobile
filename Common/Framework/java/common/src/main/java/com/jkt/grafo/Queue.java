package com.jkt.grafo;

import java.util.ArrayList;

/**
 * <p>Implementacion de una cola comun y corriente utilizando {@link ArrayList}</p>
 * <p>Queda mas limpio usar metodos como push y pop, que andar haciendo referencia a la posicion cero a mano.</p>
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class Queue extends ArrayList<Object> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Object pop(){
		return this.remove(0);
	}
	
	public void push(Object object){
		this.add(object);
	}
	
}
