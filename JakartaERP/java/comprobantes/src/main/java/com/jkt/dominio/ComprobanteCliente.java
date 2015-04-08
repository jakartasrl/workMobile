package com.jkt.dominio;

import javax.validation.constraints.NotNull;

import lombok.Data;

import com.jkt.erp.varios.Cliente;
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
@Data
public class ComprobanteCliente extends Comprobante {

	@NotNull(message="Debe seleccionar la sucursal del cliente")
	private ClienteSucursal clienteSucursal;
	
	private Cliente cliente;
	
	private CondPago condicionPago;

}
