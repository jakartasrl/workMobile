package com.jkt.dominio;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

import lombok.Data;

import com.jkt.erp.varios.Representante;
import com.jkt.erp.varios.Vendedor;
import com.jkt.varios.dominio.Contacto;

/**
 * Comprobante que representa un evento de cotizacion/pedido
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public abstract class ComprobanteVenta extends ComprobanteCliente {

	@NotNull(message="Debe ingresar obligatoriamente un vendedor.")
	private Vendedor vendedor;
	private int tipoVenta=0;
	
	private Representante representante;
	
	private Date fechaVencimiento;
	private String referencia;
	
	private List<Contacto> contactosReferencia =  new ArrayList<Contacto>();

}
