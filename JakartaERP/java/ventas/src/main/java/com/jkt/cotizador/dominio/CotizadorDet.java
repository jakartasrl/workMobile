package com.jkt.cotizador.dominio;

import org.hibernate.validator.constraints.Range;

import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.articulos.Producto;
import com.jkt.varios.dominio.Moneda;
import com.jkt.varios.dominio.UnidadMedida;

/**
 * Representa al un detalle de un cotizador.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class CotizadorDet extends PersistentEntity {

	private Producto producto;
	private Cotizador cotizador;
	private double cantidad;
	private UnidadMedida unidadMedida;
	private double precioUnitario;
	private Moneda moneda;
	
	private double precio; //Se agrego para el cotizador
	
	@Range(min=0,max=500, message="El mark up  debe estar entre 1 y 500")
	private double markUp;
	
	private double cotizacion;
	private double importeVenta;
	private ConceptoPresupuesto conceptoPresupuesto;
	private TituloModeloCotizador tituloModeloCotizador;
	
	
	
	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public TituloModeloCotizador getTituloModeloCotizador() {
		return tituloModeloCotizador;
	}

	public void setTituloModeloCotizador(TituloModeloCotizador tituloModeloCotizador) {
		this.tituloModeloCotizador = tituloModeloCotizador;
	}

	public double getImporteVenta() {
		return importeVenta;
	}

	public void setImporteVenta(double importeVenta) {
		this.importeVenta = importeVenta;
	}
	
	public Producto getProducto() {
		return producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}

	public Moneda getMoneda() {
		return moneda;
	}

	public void setMoneda(Moneda moneda) {
		this.moneda = moneda;
	}

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

	public double getCantidad() {
		return cantidad;
	}

	public void setCantidad(double cantidad) {
		this.cantidad = cantidad;
	}

	public double getMarkUp() {
		return markUp;
	}

	public void setMarkUp(double markUp) {
		this.markUp = markUp;
	}

	public UnidadMedida getUnidadMedida() {
		return unidadMedida;
	}

	public void setUnidadMedida(UnidadMedida unidadMedida) {
		this.unidadMedida = unidadMedida;
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
	
	/*
	 * EQUAL & HASHCODE
	 */
	
	public boolean equals(Object other) {
		if (this == other)
			return true;
		if (!(other instanceof CotizadorDet))
			return false;

		final CotizadorDet detalle = (CotizadorDet) other;

		if (detalle.getId() == 0)
			return false;

		if (!(detalle.getId() == getId()))
			return false;

		return true;
	}

	public int hashCode() {
		int result;
		result = (int) (29 * getId());
		return result;
	}

}
