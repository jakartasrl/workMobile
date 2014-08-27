package com.jkt.varios;

import java.util.ArrayList;
import java.util.List;

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
public class CondPago extends Descriptible {

	private static final long serialVersionUID = -9158567606744309528L;
	private boolean baseFechaFactura, baseFechaRecep;
	private List<CondPagoDet> detalles = new ArrayList<CondPagoDet>();
	
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
	public List<CondPagoDet> getDetalles() {
		return detalles;
	}
	public void setDetalles(List<CondPagoDet> detalles) {
		this.detalles = detalles;
	}



}
