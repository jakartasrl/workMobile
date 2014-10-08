package com.jkt.cotizador.dominio;

import com.jkt.dominio.PersistentEntity;
import com.jkt.varios.dominio.UnidadMedida;

/**
 * Representa al un detalle de un cotizador.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class CotizadorDet extends PersistentEntity {

	private Cotizador cotizador;
	private int cantidad;
	private UnidadMedida uniMed;
	private double precioUnitario;
	// private Moneda moneda;
	private double cotizacion;
	private ConceptoPresupuesto conceptoPresupuesto;

	
	public ConceptoPresupuesto getConceptoPresupuesto() {
		return conceptoPresupuesto;
	}

	public void setConceptoPresupuesto(ConceptoPresupuesto conceptoPresupuesto) {
		this.conceptoPresupuesto = conceptoPresupuesto;
	}

	public Cotizador getCotizador() {
		return cotizador;
	}

	public void setCotizador(Cotizador cotizador) {
		this.cotizador = cotizador;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public UnidadMedida getUniMed() {
		return uniMed;
	}

	public void setUniMed(UnidadMedida uniMed) {
		this.uniMed = uniMed;
	}

	public double getPrecioUnitario() {
		return precioUnitario;
	}

	public void setPrecioUnitario(double precioUnitario) {
		this.precioUnitario = precioUnitario;
	}

	public double getCotizacion() {
		return cotizacion;
	}

	public void setCotizacion(double cotizacion) {
		this.cotizacion = cotizacion;
	}

}
