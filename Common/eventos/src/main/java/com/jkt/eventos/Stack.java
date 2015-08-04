package com.jkt.eventos;

import java.util.ArrayList;

/**
 * <p>Implementacion de una pila comun y corriente utilizando {@link ArrayList}</p>
 * <p>Queda mas limpio usar metodos como push y pop, que andar haciendo referencia a la posicion cero a mano.</p>
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class Stack extends ArrayList<Object> {

	public Object pop(){
		return this.remove(this.size()-1);
	}
	
	public void push(Object object){
		this.add(object);
	}
	
}
