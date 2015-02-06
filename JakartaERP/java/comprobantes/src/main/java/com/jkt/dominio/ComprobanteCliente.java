package com.jkt.dominio;

import javax.validation.constraints.NotNull;

import com.jkt.erp.varios.ClienteSucursal;
import com.jkt.varios.dominio.CondPago;


/**
 * Cuando un comprobante tiene una relación con el cliente, se genera una instancia de esta clase.
 * 
 * @see Comprobante
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ComprobanteCliente extends Comprobante {

	@NotNull(message="Debe seleccionar la sucursal del cliente")
	private ClienteSucursal clienteSucursal;
	private CondPago condicionPago;
	
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
