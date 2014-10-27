package com.jkt.dominio;

import com.jkt.erp.varios.ClienteSucursal;
import com.jkt.varios.dominio.CondPago;


/**
 * Cuando un comprobante tiene una relaci�n con el cliente, se genera una instancia de esta clase.
 * 
 * @see Comprobante
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ComprobanteCliente extends Comprobante {

	private ClienteSucursal clienteSucursal;
	private CondPago condicionPago;
	
	private boolean cargaACargoDeCliente, transporteACargoDeCliente, descargaACargoDeCliente;
	
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

	public ClienteSucursal getClienteSucursal() {
		return clienteSucursal;
	}

	public void setClienteSucursal(ClienteSucursal clienteSucursal) {
		this.clienteSucursal = clienteSucursal;
	}

	public CondPago getCondicionPago() {
		return condicionPago;
	}

	public void setCondicionPago(CondPago condicionPago) {
		this.condicionPago = condicionPago;
	}

}
