package com.jkt.cotizador.dominio;

import com.jkt.dominio.Descriptible;

public class TituloModeloCotizador extends Descriptible {

	private TituloModeloCotizador tituloPadre, tituloHijo;
	private ConceptoPresupuesto conceptoPresupuesto;
	
	public ConceptoPresupuesto getConceptoPresupuesto() {
		return conceptoPresupuesto;
	}

	public void setConceptoPresupuesto(ConceptoPresupuesto conceptoPresupuesto) {
		this.conceptoPresupuesto = conceptoPresupuesto;
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

}
