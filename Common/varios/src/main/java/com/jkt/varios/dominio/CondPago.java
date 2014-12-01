package com.jkt.varios.dominio;

import java.util.HashSet;
import java.util.Set;

import javax.validation.constraints.NotNull;

import com.jkt.dominio.Descriptible;
import com.jkt.varios.validadores.ValidadorCondPago;

/**
 * <p> Representa las condiciones de pago que luego se asociaran a clientes o proveedores </p>
 * <p> Se utilizara para el calculo de las fechas de vencimientos de las facturas de clientes y proveedores</p>
 * 
 * @see CondPagoDet
 * @see ValidadorCondPago
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class CondPago extends Descriptible{

	@NotNull
	private boolean baseFechaFactura;

	@NotNull
	private boolean baseFechaRecep;

	private Set<CondPagoDet> detalles = new HashSet<CondPagoDet>();
	
	public boolean isBaseFechaFactura() {
		return baseFechaFactura;
	}
	public void setBaseFechaFactura(boolean baseFechaFactura) {
		this.baseFechaFactura = baseFechaFactura;
	}
	public boolean isBaseFechaRecep() {
		return baseFechaRecep;
	}
	public void setBaseFechaRecep(boolean baseFechaRecep) {
		this.baseFechaRecep = baseFechaRecep;
	}

	/*
	 * Metodos para los booleanos, para ser utilizados desde el core dnd solo se entiende GET o SET.
	 */
	public boolean getBaseFechaFactura(){
		return isBaseFechaFactura();
	}

	public Set<CondPagoDet> getDetalles() {
		return detalles;
	}
	public void setDetalles(Set<CondPagoDet> detalles) {
		this.detalles = detalles;
	}
	public boolean getBaseFechaRecep(){
		return isBaseFechaRecep();
	}
	
	public void addDetalle(CondPagoDet detalle){
		if (detalle.getId()==0) {
			detalles.add(detalle);
			return;
		}
		
		if(!detalles.contains(detalle)){
			detalles.add(detalle);
			detalle.setCondicionDePago(this);
		}
	}
	

}
