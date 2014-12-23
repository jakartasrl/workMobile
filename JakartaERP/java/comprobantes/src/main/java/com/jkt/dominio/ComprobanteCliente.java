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

//	@NotNull(message="El comprobante que se esta creando debe tener relacionado un cliente.")
	@NotNull(message="Debe seleccionar la sucursal del cliente")
	private ClienteSucursal clienteSucursal;
	private CondPago condicionPago;
	
//	private boolean cargaACargoDeCliente, transporteACargoDeCliente, descargaACargoDeCliente;
//	private boolean cargaACargoDeEmpresa, transporteACargoDeEmpresa, descargaACargoDeEmpresa;

	//transientmethods
//	public boolean isCargaACargoDeEmpresa() {
//		return !cargaACargoDeCliente;
//	}
//
//	public boolean isTransporteACargoDeEmpresa() {
//		return !transporteACargoDeCliente;
//	}
//
//	public boolean isDescargaACargoDeEmpresa() {
//		return !descargaACargoDeCliente;
//	}
//	//transientmethods
//
//	
//	public void setDescargaACargoDeEmpresa(boolean descargaACargoDeEmpresa) {
//		this.descargaACargoDeEmpresa = descargaACargoDeEmpresa;
//	}
//
//	public boolean isCargaACargoDeCliente() {
//		return cargaACargoDeCliente;
//	}
//
//	public void setCargaACargoDeCliente(boolean cargaACargoDeCliente) {
//		this.cargaACargoDeCliente = cargaACargoDeCliente;
//	}
//
//	public boolean isTransporteACargoDeCliente() {
//		return transporteACargoDeCliente;
//	}
//
//	public void setTransporteACargoDeCliente(boolean transporteACargoDeCliente) {
//		this.transporteACargoDeCliente = transporteACargoDeCliente;
//	}
//
//	public boolean isDescargaACargoDeCliente() {
//		return descargaACargoDeCliente;
//	}
//
//	public void setDescargaACargoDeCliente(boolean descargaACargoDeCliente) {
//		this.descargaACargoDeCliente = descargaACargoDeCliente;
//	}

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
