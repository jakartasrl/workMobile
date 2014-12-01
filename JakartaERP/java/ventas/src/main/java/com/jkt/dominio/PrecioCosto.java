package com.jkt.dominio;

import java.util.Date;

import com.jkt.cotizador.dominio.ConceptoPresupuesto;
import com.jkt.varios.dominio.Moneda;

/**
 * Define los precios para un concepto teniendo en cuenta la fecha y la
 * {@link Moneda}
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class PrecioCosto extends PersistentEntity {

	private ConceptoPresupuesto conceptoPresupuesto;
	private Moneda moneda;
	private Date fecha;
	private double costo;
	private double precioVenta;

	public ConceptoPresupuesto getConceptoPresupuesto() {
		return conceptoPresupuesto;
	}

	public void setConceptoPresupuesto(ConceptoPresupuesto conceptoPresupuesto) {
		this.conceptoPresupuesto = conceptoPresupuesto;
	}

	public Moneda getMoneda() {
		return moneda;
	}

	public void setMoneda(Moneda moneda) {
		this.moneda = moneda;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public double getCosto() {
		return costo;
	}

	public void setCosto(double costo) {
		this.costo = costo;
	}

	public double getPrecioVenta() {
		return precioVenta;
	}

	public void setPrecioVenta(double precioVenta) {
		this.precioVenta = precioVenta;
	}
	
	public void setearReferencias(ConceptoPresupuesto conceptoPresupuesto){
		this.conceptoPresupuesto=conceptoPresupuesto;
		conceptoPresupuesto.agregarPrecio(this);
	}

}
