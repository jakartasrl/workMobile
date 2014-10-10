package com.jkt.cotizador.dominio;

import com.jkt.dominio.Descriptible;
import com.jkt.varios.dominio.ComponenteValor;

public class ConceptoPresupuesto extends Descriptible {

//	instance vars
	private TituloModeloCotizador titulo;
	private boolean pideArticulo;
	private ComponenteValor componenteValor;
	
//	getters and setters
	public boolean isPideArticulo() {
		return pideArticulo;
	}
	public TituloModeloCotizador getTitulo() {
		return titulo;
	}
	public void setTitulo(TituloModeloCotizador titulo) {
		this.titulo = titulo;
	}
	public void setPideArticulo(boolean pideArticulo) {
		this.pideArticulo = pideArticulo;
	}
	public ComponenteValor getComponenteValor() {
		return componenteValor;
	}
	public void setComponenteValor(ComponenteValor componenteValor) {
		this.componenteValor = componenteValor;
	}
	
}
