package com.jkt.erp.varios;

import com.jkt.dominio.PersistentEntity;

/**
 * Representa a (¿La relacion entre cliente y cuenta corriente?)
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ClienteCtaCte extends PersistentEntity {

	private Cliente cliente;
	private ClienteSucursal clienteSucursal;

	public ClienteSucursal getClienteSucursal() {
		return clienteSucursal;
	}

	public void setClienteSucursal(ClienteSucursal clienteSucursal) {
		this.clienteSucursal = clienteSucursal;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

}
