package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

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
	
	private DescriptibleOV pais = new DescriptibleOV();
	private long idPais;
	private String codPais;
	private String descPais;
	
	private ProvinciaOV provincia = new ProvinciaOV();
	private long idProvincia;
	private String codProvincia;
	private String descProvincia;
	
	private List<DomicilioEntregaOV> domiciliosDeEntrega=new ArrayList<DomicilioEntregaOV>();
	
	private List<ContactoOV> contactos=new ArrayList<ContactoOV>();
	
}
