package com.jkt.varios.dominio;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import com.jkt.dominio.Descriptible;

/**
 * <p>Representa a un componente de un {@link Clasificador}</p>
 * <p>Se utilizar� para poder clasificar de distintas aneras a los objetos de las entidades clasificables</p>
 * <p>Un mismo componente puede estar en 2 clasificadores distintos</p>
 * 
 * @see ComponenteValor
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Componente extends Descriptible {

	@NotNull
	private Clasificador clasificador;
	
	private Componente componentePadre;
	private Componente componenteHijo;
	private List<ComponenteValor> valores=new ArrayList<ComponenteValor>();
	
	private int codigoInterno,codigoInternoPadre;
	
	
	
	public int getCodigoInterno() {
		return codigoInterno;
	}

	public void setCodigoInterno(int codigoInterno) {
		this.codigoInterno = codigoInterno;
	}

	public int getCodigoInternoPadre() {
		return codigoInternoPadre;
	}

	public void setCodigoInternoPadre(int codigoInternoPadre) {
		this.codigoInternoPadre = codigoInternoPadre;
	}

	/*
	 * Metodo para agregar como corresponde el arbol en forma de lista enlazada.
	 * 
	 */
//	private boolean flag=false;
	public void agregarValor(ComponenteValor valor){
		
		//Ejecucion de este metodo como si fuese estatico, ejecutado una sola vez, la primera vez que es ejecutado el metodo agregarValor
		//SETEA A TODOS EN DESACTIVADOS
//		if(!flag){
//			for (ComponenteValor valorActual : valores) {
//				valorActual.setActivo(false);
//			}
//			flag=true;
//		}
//		
//		if (!valores.contains(valor)) {
//			valores.add(valor);
//			valor.setComponente(this);
//		}else{
//			valor.setActivo(true);
//		}
		if (valor!=null) {
			valores.add(valor);
			valor.setComponente(this);
		}
	}

	public List<ComponenteValor> getValores() {
		return valores;
	}

	public void setValores(List<ComponenteValor> valores) {
		this.valores = valores;
	}

	/*
	 * Campos transientes para facilitar la lectura en los clientes
	 */
	private int nivel, nivelSuperior;
	
	public int getNivel() {
		return nivel;
	}

	public void setNivel(int nivel) {
		this.nivel = nivel;
	}

	public int getNivelSuperior() {
		return nivelSuperior;
	}

	public void setNivelSuperior(int nivelSuperior) {
		this.nivelSuperior = nivelSuperior;
	}
	/*
	 * Campos transientes para facilitar la lectura en los clientes
	 */

	
	public Clasificador getClasificador() {
		return clasificador;
	}

	public void setClasificador(Clasificador clasificador) {
		this.clasificador = clasificador;
	}

	public Componente getComponentePadre() {
		return componentePadre;
	}

	public void setComponentePadre(Componente componentePadre) {
		this.componentePadre = componentePadre;
	}

	public Componente getComponenteHijo() {
		return componenteHijo;
	}

	public void setComponenteHijo(Componente componenteHijo) {
		this.componenteHijo = componenteHijo;
	}

}
