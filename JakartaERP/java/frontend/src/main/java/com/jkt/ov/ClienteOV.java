package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class ClienteOV extends DescriptibleOV {

	//Datos generales
	private String telefono;	
	private String fax;
	private String mail;
	private String nroProveedor;
	
	//Datos del SujetoImpositivo
	private SujetoImpositivoOV sujetoImpositivo;
	private long idSujetoImpositivo;
	private String razonSocial;
	private boolean personaJuridica;
	private boolean local;
	private String cuit;
	
	private List<InscripcionImpositivaOV> inscripcionesImpositivas = new ArrayList<InscripcionImpositivaOV>();
	
	//Datos de la direccion
	private DireccionOV dir = new DireccionOV();
	private long idDir;
	private String direccion;
	private String codigoPostal;
	private String localidad;
	
	private ProvinciaOV provincia = new ProvinciaOV();
	private long idProvincia;
	private String codProvincia;
	private String descProvincia;
	private DescriptibleOV pais = new DescriptibleOV();
	private long idPais;
	private String codPais;
	private String descPais;
	
	private CondPagoOV condPago;
	private long idCondPago;
	private String codCondPago;
	private String descCondPago;
	
	private RepresentanteOV representante;
	private long idRepresentante;
	private String codRepresentante;
	private String descRepresentante;
	
	private VendedorOV vendedor;
	private long idVendedor;
	private String codVendedor;
	private String descVendedor;
	
	private List<ClienteSucursalOV> listaSucursales=new ArrayList<ClienteSucursalOV>();

	
	public List obtenerFiltro(){
		ArrayList<FiltroOV> filtros = new ArrayList<FiltroOV>();
		filtros.add(new FiltroOV("codigo", this.getFiltroCodigo(), "like", "string"));
		filtros.add(new FiltroOV("descripcion", this.getFiltroDescripcion(), "like", "string"));
		filtros.add(new FiltroOV("activo", "true", "igual", "boolean"));
		return filtros;
	}
	
	
}
