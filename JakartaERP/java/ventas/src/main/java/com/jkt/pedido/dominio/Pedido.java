package com.jkt.pedido.dominio;

import com.jkt.dominio.ComprobanteVenta;
import com.jkt.grafo.IAgendable;

/**
 * <p>Un pedido es una orden de compra que se basa en un presupuesto previamente generado.</p>
 * <p>Este pedido tendrá detalles relacionados.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Pedido extends ComprobanteVenta implements IAgendable{

	private boolean cargaACargoDeCliente, transporteACargoDeCliente, descargaACargoDeCliente;
//	private boolean cargaACargoDeEmpresa, transporteACargoDeEmpresa, descargaACargoDeEmpresa;

	public boolean isPedido(){
		return true;
	}



	public boolean isCargaACargoDeCliente() {
		return cargaACargoDeCliente;
	}



	public void setCargaACargoDeCliente(boolean cargaACargoDeCliente) {
		this.cargaACargoDeCliente = cargaACargoDeCliente;
	}



	public boolean isTransporteACargoDeCliente() {
		return transporteACargoDeCliente;
	}



	public void setTransporteACargoDeCliente(boolean transporteACargoDeCliente) {
		this.transporteACargoDeCliente = transporteACargoDeCliente;
	}



	public boolean isDescargaACargoDeCliente() {
		return descargaACargoDeCliente;
	}



	public void setDescargaACargoDeCliente(boolean descargaACargoDeCliente) {
		this.descargaACargoDeCliente = descargaACargoDeCliente;
	}



	public boolean sePuedeCompletar() {
		return false;
	}



	public boolean sePuedeIniciar() {
		return true;
	}
	
	
}
