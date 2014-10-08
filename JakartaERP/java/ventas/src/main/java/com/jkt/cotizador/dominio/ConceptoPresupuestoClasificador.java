package com.jkt.cotizador.dominio;

import javax.validation.constraints.NotNull;

import com.jkt.dominio.PersistentEntity;
import com.jkt.varios.dominio.Clasificador;
import com.jkt.varios.dominio.ComponenteValor;

public class ConceptoPresupuestoClasificador extends PersistentEntity {

	@NotNull
	private Clasificador clasificador;
	
	@NotNull
	private ConceptoPresupuesto conceptoPresupuesto;
	
	@NotNull
	private ComponenteValor componenteValor;
	
	public ComponenteValor getComponenteValor() {
		return componenteValor;
	}
	
	public void setComponenteValor(ComponenteValor componenteValor) {
		if (componenteValor!=null) {
			this.componenteValor = componenteValor;
			this.clasificador=componenteValor.getComponente().getClasificador();
		}
	}

	public Clasificador getClasificador() {
		return clasificador;
	}

	public void setClasificador(Clasificador clasificador) {
		this.clasificador = clasificador;
	}

	public ConceptoPresupuesto getConceptoPresupuesto() {
		return conceptoPresupuesto;
	}

	public void setConceptoPresupuesto(ConceptoPresupuesto conceptoPresupuesto) {
		this.conceptoPresupuesto = conceptoPresupuesto;
	}
	
}



