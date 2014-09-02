package com.jkt.varios.dominio;

import java.util.HashSet;
import java.util.Set;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.jkt.dominio.Descriptible;
import com.jkt.dominio.IDescriptible;
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
public class CondPago extends Descriptible implements IDescriptible{

	private static final long serialVersionUID = -9158567606744309528L;
	
	@NotNull
	private boolean baseFechaFactura;

	@NotNull
	private boolean baseFechaRecep;

	@NotEmpty
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
//	public List<CondPagoDet> getDetalles() {
//		return detalles;
//	}
//	public void setDetalles(List<CondPagoDet> detalles) {
//		this.detalles = detalles;
//	}

	
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
		if(!detalles.contains(detalle)){
			detalles.add(detalle);
			detalle.setCondicionDePago(this);
		}
	}
	
	
	public String getCadena() {
		return this.getDescripcion();
	}
	public String getCadena2() {
		// TODO Auto-generated method stub
		return null;
	}
	public int getEntero() {
		// TODO Auto-generated method stub
		return 0;
	}
	public int getEntero2() {
		// TODO Auto-generated method stub
		return 0;
	}
	public float getFloat() {
		// TODO Auto-generated method stub
		return 0;
	}
	public float getFloat2() {
		// TODO Auto-generated method stub
		return 0;
	}

}
