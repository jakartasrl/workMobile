package com.jkt.dominio;

import java.util.Date;

import com.jkt.cotizador.dominio.ConceptoPresupuesto;
import com.jkt.erp.articulos.Producto;
import com.jkt.excepcion.JakartaException;
import com.jkt.laboratorio.dominio.Determinacion;
import com.jkt.varios.dominio.Moneda;

/**
 * Define los precios para un concepto, articulo o determinacion de laboratorio teniendo en cuenta la fecha y la {@link Moneda}
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class PrecioCosto extends PersistentEntity {

	private static final String MENSAJE_ERROR = "Existe una inconsistencia con el costo de precio. El costo no define el precio de ningun elemento.";
	private String oidElemento;
	
	public String getOidElemento() {
		return oidElemento;
	}

	public void setOidElemento(String oidElemento) {
		this.oidElemento = oidElemento;
	}

	public long getIdentificadorElemento() throws JakartaException{
	
		if (defineCostoConcepto()) {
			return conceptoPresupuesto.getId();
		}
		if (defineCostoDeterminacion()) {
			return determinacion.getId();
		}
		if (defineCostoProducto()) {
			return producto.getId();
		}
		throw new JakartaException(MENSAJE_ERROR);
	}
	
	public String getCodigoElemento() throws JakartaException{
		
		if (defineCostoConcepto()) {
			return conceptoPresupuesto.getCodigo();
		}
		if (defineCostoDeterminacion()) {
			return determinacion.getCodigo();
		}
		if (defineCostoProducto()) {
			return producto.getCodigo();
		}
		throw new JakartaException(MENSAJE_ERROR);
	}

	
	public String getDescripcionElemento() throws JakartaException{
		if (defineCostoConcepto()) {
			return conceptoPresupuesto.getDescripcion();
		}
		if (defineCostoDeterminacion()) {
			return determinacion.getDescripcion();
		}
		if (defineCostoProducto()) {
			return producto.getDescripcion();
		}
		throw new JakartaException(MENSAJE_ERROR);
	}
	
	private Moneda moneda;
	private Date fecha;
	private double costo;
//	private double precioVenta;
	
	/*
	 * Como regla de negocio, se define que si un costo es de un articulo, no puede ser de una determinacion ni de concepto.
	 * Solamente uno debe ser verdadero o en este caso, completo con datos.
	 */
	private ConceptoPresupuesto conceptoPresupuesto;
	private Determinacion determinacion;
	private Producto producto;
	
	/*
	 * Helper methods
	 */
	public boolean defineCostoProducto(){
		return producto!=null;
	}
	
	public boolean defineCostoConcepto(){
		return conceptoPresupuesto!=null;
	}

	public boolean defineCostoDeterminacion(){
		return determinacion!=null;
	}
	
	/**
	 * Verifica si el precio de costo es consistente en cuanto al elemento que asigna un precio.
	 * 
	 * @return consistencia
	 */
	public boolean esConsistente(){
		int cantidad=0;
		
		if (defineCostoConcepto()) {
			cantidad++;
		}
		if (defineCostoProducto()) {
			cantidad++;
		}
		if (defineCostoDeterminacion()) {
			cantidad++;
		}
		
		return cantidad==1;
	}
	/*
	 * Helper methods
	 */
	
	public Determinacion getDeterminacion() {
		return determinacion;
	}

	public void setDeterminacion(Determinacion determinacion) {
		this.determinacion = determinacion;
	}

	public Producto getProducto() {
		return producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}

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

//	public double getPrecioVenta() {
//		return precioVenta;
//	}
//
//	public void setPrecioVenta(double precioVenta) {
//		this.precioVenta = precioVenta;
//	}
//	
	/*
	 * unused method
	 * 
	public void setearReferencias(ConceptoPresupuesto conceptoPresupuesto){
		this.conceptoPresupuesto=conceptoPresupuesto;
		conceptoPresupuesto.agregarPrecio(this);
	}
	*/

}
