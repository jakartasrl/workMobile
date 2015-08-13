package com.jkt.ov;

import lombok.Data;

@Data
public class ClienteSucursalOV extends DescriptibleOV {
	
	private String numero;
	private String direccion;
	private String codigoPostal;
	private String localidad;
	private String telefono;
	private String domicilioEntregaDeFactura;
	
	private VendedorOV vendedor = new VendedorOV();
	private long idVendedor;
	private String codVendedor;
	private String descVendedor;
	
	private RepresentanteOV representante = new RepresentanteOV();
	private long idRepresentante;
	private String codRepresentante;
	private String descRepresentante;
	
	private ProvinciaOV provincia = new ProvinciaOV();
	private long idProvincia;
	private String codProvincia;
	private String descProvincia;
	
}
