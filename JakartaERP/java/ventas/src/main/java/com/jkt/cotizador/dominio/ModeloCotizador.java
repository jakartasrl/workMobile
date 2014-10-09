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
	private TituloModeloCotizador titulo;

	/*
	 * Objetos transientes.
	 */
	private List<TituloModeloCotizador> titulos=new ArrayList<TituloModeloCotizador>();
	private List<ConceptoPresupuesto> conceptos=new ArrayList<ConceptoPresupuesto>();
	
	
	public List<ConceptoPresupuesto> getConceptos() {
		return conceptos;
	}

	public void setConceptos(List<ConceptoPresupuesto> conceptos) {
		this.conceptos = conceptos;
	}

	public void agregarConcepto(ConceptoPresupuesto conceptoPresupuesto){
		if (!conceptos.contains(conceptoPresupuesto)) {
			conceptos.add(conceptoPresupuesto);
		}
	}
	
	public void agregarTitulo(TituloModeloCotizador titulo){
		if (!titulos.contains(titulo)) {
			titulos.add(titulo);
		}
	}
	
	public List<TituloModeloCotizador> getTitulos() {
		return titulos;
	}

	public void setTitulos(List<TituloModeloCotizador> titulos) {
		this.titulos = titulos;
	}

	public TituloModeloCotizador getTitulo() {
		return titulo;
	}

	public void setTitulo(TituloModeloCotizador titulo) {
		this.titulo = titulo;
	}
	
}
