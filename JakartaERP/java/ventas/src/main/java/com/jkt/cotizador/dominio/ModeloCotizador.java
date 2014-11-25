package com.jkt.cotizador.dominio;

import java.util.ArrayList;
import java.util.List;

import com.jkt.dominio.Descriptible;

/**
 * <p>Un modelo de cotizador será para facilitar la tarea a los empleados que se encargan de cotizar.</p>
 * <p>Si se deben cotizar en diferentes dimnensiones, se pueden usar diferentes modelos de cotizador.</p>
 * <p>Por ejemplo, para un cambio de aceite de un transfo, será un cotizador pequeño, con no tantos datos.</p>
 * <p>En cambio, para presupuestar la venta de un transformador a medida, se necesitaran muchos datos, caracteristicas y demas.</p>
 * 
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ModeloCotizador extends Descriptible {

	/*
	 * Objetos persistentes
	 */
	private List<TituloModeloCotizador> titulos=new ArrayList<TituloModeloCotizador>();

	/*
	 * Objetos transientes.
	 */
	private List<TituloModeloCotizador> titulosTransientes=new ArrayList<TituloModeloCotizador>();
	

	public List<TituloModeloCotizador> getTitulosTransientes() {
		return titulosTransientes;
	}

	public void setTitulosTransientes(List<TituloModeloCotizador> titulosTransientes) {
		this.titulosTransientes = titulosTransientes;
	}

	public void agregarTitulo(TituloModeloCotizador titulo){
		if (!titulos.contains(titulo)) {
			titulos.add(titulo);
			titulo.setModeloCotizador(this);
		}
	}
	
	public void agregarTituloTransiente(TituloModeloCotizador titulo){
		if (!titulosTransientes.contains(titulo)) {
			titulosTransientes.add(titulo);
		}
	}
	
	public List<TituloModeloCotizador> getTitulos() {
		return titulos;
	}

	public void setTitulos(List<TituloModeloCotizador> titulos) {
		this.titulos = titulos;
	}
	
}
