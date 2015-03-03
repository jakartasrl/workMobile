package com.jkt.grafo;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.collections.Closure;

import com.jkt.dominio.PersistentEntity;

/**
 * Representa a un nodo del grafo.(Obviamente tambien el grafo, en el cual las aristas no seran modeladas)
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
abstract public class NodoGenerico<T extends DatoNodo> extends PersistentEntity {

	private boolean completo = false;
	private String descripcion;
	private List<NodoGenerico<T>> precedentes = new ArrayList<NodoGenerico<T>>();
	private List<NodoGenerico<T>> posteriores = new ArrayList<NodoGenerico<T>>();
	private T dato;

	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public boolean isCompleto() {
		return completo;
	}
	public void setCompleto(boolean completo) {
		this.completo = completo;
	}
	public T getDato() {
		return dato;
	}
	public void setDato(T dato) {
		this.dato = dato;
	}

	
	public boolean tieneTodosLosPrecedentesCumplidos(){
		for (NodoGenerico<T> nodo : precedentes) {
			if (!nodo.isCompleto()) {
				return false;
			}
		}
		return true;
	}
	
	/**
	 * 
	 * Helper method para consultar si esta completo este nodo.
	 * 
	 * @return true|false si todos los precedentes estan completos y ademas el dato del nodo permite ejecutar
	 */
	public boolean sePuedeIniciar() {

		if (!tieneTodosLosPrecedentesCumplidos()) {
			return false;
		}

		return true;
//		return getDato().sePuedeCompletar();
	}

	public void agregarPrecedente(NodoGenerico<T> nodo) {
		this.precedentes.add(nodo);
		nodo.getPosteriores().add(this);
	}

	public void agregarPosterior(NodoGenerico<T> nodo) {
		this.posteriores.add(nodo);
		nodo.getPrecedentes().add(this);
	}
	
	
	/*
	 * Algoritmos para recorrer en amplitud
	 * 
	 */
	/**
	 * Recorre el grafo ejecutando en cada nodo un {@link Closure}
	 * 
	 * @param closure para ejecutar en cada nodo
	 */
	private void bfsWithClosure(Closure closure){
		final Queue queue = new Queue();
		final Set<NodoGenerico<T>> visitados=new HashSet<NodoGenerico<T>>();
		
		visitados.add(this);
		closure.execute(this);

		queue.push(this);
		
		while(!queue.isEmpty()){
			NodoGenerico<T> nodo = (NodoGenerico<T>) queue.pop();
			
			for (NodoGenerico<T> nodoActual: nodo.posteriores) {
				if (!visitados.contains(nodoActual)) {
					closure.execute(nodoActual);
				}
			}
			
			for (NodoGenerico<T> nodoActual: nodo.posteriores) {
				if (!visitados.contains(nodoActual)) {
					visitados.add(nodoActual);
					queue.push(nodoActual);
				}
			}
		}
	}
		
	
	/**
	 * Recorre cada nodo imprimiendo su descripcion.
	 */
	public void bfs(){
		this.bfsWithClosure(new Closure() {
			public void execute(Object input) {
				NodoGenerico<T> nodo=(NodoGenerico<T>) input;
				System.out.println(nodo.getDescripcion());
			}
		});
	}

	/**
	 * Recorre el grafo ejecutando un closure
	 * 
	 * @param closure para ejecutar en cada nodo
	 */
	public void bfs(Closure closure){
		this.bfsWithClosure(closure);
	}

	
	/*
	 * Algoritmos para recorrer en profundidad
	 * 
	 */
	/**
	 * Recorrido en profundidad imprimiendo la descripcion de cada nodo
	 */
	public void dfs(){
		dfsWithClosure(new Closure() {
			public void execute(Object input) {
				NodoGenerico<T> nodo=(NodoGenerico<T>) input;
				System.out.println(nodo.getDescripcion());
				log.warn(nodo.getDescripcion());
			}
		});
	}
	
	

	/**
	 * DFS que ejecuta para cada nodo un {@link Closure}
	 * 
	 * @param closure para ejecutar en cada nodo
	 */
	public void dfs(Closure closure){
		dfsWithClosure(closure);
	}
	
	/**
	 * Recorrido en profundidad ejecutando para cada nodo un {@link Closure}
	 * 
	 * @param closure para ejecutar en cada nodo
	 */
	private void dfsWithClosure(Closure closure){
		Stack stack = new Stack();
		stack.push(this);
		final Set<NodoGenerico<T>> visitados=new HashSet<NodoGenerico<T>>();
		
        while(stack.size() > 0){
        	NodoGenerico<T> actual = (NodoGenerico<T>) stack.pop();
            if(!visitados.contains(actual)){
            	visitados.add(actual);
        		closure.execute(actual);
                
        		for (NodoGenerico nodoGenerico : actual.posteriores) {
					stack.push(nodoGenerico);
				}
            }
        }
    }
	public List<NodoGenerico<T>> getPrecedentes() {
		return precedentes;
	}
	public void setPrecedentes(List<NodoGenerico<T>> precedentes) {
		this.precedentes = precedentes;
	}
	public List<NodoGenerico<T>> getPosteriores() {
		return posteriores;
	}
	public void setPosteriores(List<NodoGenerico<T>> posteriores) {
		this.posteriores = posteriores;
	}
	
	
	

}
