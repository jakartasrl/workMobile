package com.jkt.cotizador.dominio;

import java.util.ArrayList;
import java.util.List;

import org.hsqldb.lib.ArrayListIdentity;

import com.jkt.dominio.Descriptible;

public class ConceptoPresupuesto extends Descriptible {

//	instance vars
	private boolean pideArticulo;
	private List<ConceptoPresupuestoClasificador> clasificadores=new ArrayList<ConceptoPresupuestoClasificador>();
	
//	getters and setters
	public boolean isPideArticulo() {
		return pideArticulo;
	}
	public void setPideArticulo(boolean pideArticulo) {
		this.pideArticulo = pideArticulo;
	}
	public List<ConceptoPresupuestoClasificador> getClasificadores() {
		return clasificadores;
	}
	public void setClasificadores(
			List<ConceptoPresupuestoClasificador> clasificadores) {
		this.clasificadores = clasificadores;
	}

//	helper methods
	
	public void agregarClasificador(ConceptoPresupuestoClasificador clasificador){
		if (!clasificadores.contains(clasificador)) {
			clasificadores.add(clasificador);
			clasificador.setConceptoPresupuesto(this);
		}
	}
	
}
