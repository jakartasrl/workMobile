package com.jkt.dominio;

import com.jkt.erp.varios.ClienteSucursal;
import com.jkt.varios.dominio.CondPago;


/**
 * TODO write a little coment.
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ComprobanteCliente extends Comprobante {

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
