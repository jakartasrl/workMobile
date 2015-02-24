package com.jkt.dominio;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.jkt.varios.dominio.Contacto;

/**
 * Esta clase genera una cotización con items a cotizar independientes.
 * <p>Una cotización puede pasarse a presupuestar, y generar una instancia de un Presupuesto, siempre y cuando todos los items de la cotización estén
 * cotizados y autorizador.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Cotizacion extends ComprobanteVenta {

	public enum Estado { PENDIENTE, INICIADA };
	
	private String estado;
	
	/*
	 * Campo transiente para mostrar en el alta de presupuesto basado en una cotizacion
	 */
	private String potencialNroPresupuesto;
	
	public String getPotencialNroPresupuesto() {
		return potencialNroPresupuesto;
	}

	public void setPotencialNroPresupuesto(String potencialNroPresupuesto) {
		this.potencialNroPresupuesto = potencialNroPresupuesto;
	}
	/*
	 * Campo transiente para mostrar en el alta de presupuesto basado en una cotizacion
	 */

	
	private List<CotizacionDet> detalles = new ArrayList<CotizacionDet>();

	public List<CotizacionDet> getDetalles() {
		return detalles;
	}

	public void setDetalles(List<CotizacionDet> detalles) {
		this.detalles = detalles;
	}
	
	/*
	 * Setters y getters
	 */
	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getDescripcion(){
		return String.format("%s/%s",this.getFecha().toString(), this.getClienteSucursal().getDescripcion());
	}
	
	public String getCodigo(){
		return String.valueOf(this.getNro());
	}
	
	public void agregarDetalle(CotizacionDet cotizacionDet){
		if (!detalles.contains(cotizacionDet)) {
			detalles.add(cotizacionDet);
			cotizacionDet.setComprobanteVenta(this);
		}
	}
	
	public boolean isCotizacion(){
		return true;
	}
}
