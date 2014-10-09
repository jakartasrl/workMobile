package com.jkt.cotizador.dominio;

import java.util.ArrayList;
import java.util.List;

import com.jkt.dominio.Descriptible;

public class TituloModeloCotizador extends Descriptible {

	/*
	 * Atributos persistentes
	 */
	private TituloModeloCotizador tituloPadre, tituloHijo;
	private List<ConceptoPresupuesto> conceptos=new ArrayList<ConceptoPresupuesto>();
	private ModeloCotizador modeloCotizador;
	/*
	 * atributos transientes para el manejo de jerarquia en arbol.
	 */
	private int codigoInterno,codigoInternoPadre;

	public ModeloCotizador getModeloCotizador() {
		return modeloCotizador;
	}

	public void setModeloCotizador(ModeloCotizador modeloCotizador) {
		this.modeloCotizador = modeloCotizador;
	}

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

	public List<ConceptoPresupuesto> getConceptos() {
		return conceptos;
	}

	public void setConceptos(List<ConceptoPresupuesto> conceptos) {
		this.conceptos = conceptos;
	}

	public TituloModeloCotizador getTituloPadre() {
		return tituloPadre;
	}

	public void setTituloPadre(TituloModeloCotizador tituloPadre) {
		this.tituloPadre = tituloPadre;
	}

	public TituloModeloCotizador getTituloHijo() {
		return tituloHijo;
	}

	public void setTituloHijo(TituloModeloCotizador tituloHijo) {
		this.tituloHijo = tituloHijo;
	}
	
	public void agregarTodosLosConceptos(List<ConceptoPresupuesto> conceptos){
		for (ConceptoPresupuesto conceptoPresupuesto : conceptos) {
			if (!this.conceptos.contains(conceptoPresupuesto)) {
				this.conceptos.add(conceptoPresupuesto);
				conceptoPresupuesto.setTitulo(this);
			}
		}
	}

}
