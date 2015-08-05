package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import lombok.Data;

import org.hibernate.validator.constraints.NotEmpty;

import com.jkt.erp.varios.ClienteClasificador;
import com.jkt.erp.varios.ClienteSucursal;
import com.jkt.erp.varios.EsquemaPreciosCliente;
import com.jkt.varios.dominio.CondPago;
import com.jkt.varios.dominio.Idioma;

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
	
	//Datos de la direccion
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
	
	private RepresentanteOV representante;
	private VendedorOV vendedor;
	
	private Idioma idioma;
	
	private List<EsquemaPreciosCliente> listaEsquemaPrecios=new ArrayList<EsquemaPreciosCliente>();
	
	@NotEmpty(message="Es necesario que el cliente tenga como minimo una sucursal.")
	private List<ClienteSucursal> listaSucursales=new ArrayList<ClienteSucursal>();
	
	private List<ClienteClasificador> listaClasificadores=new ArrayList<ClienteClasificador>();
	
	@NotNull(message="El cliente debe tener una condicion de pago.")
	private CondPago condPago;
	
	public String getDescripcion(){
		return sujetoImpositivo.getRazonSocial();
	}
	
	public String getAdicional1() {
		return this.getTelefono();
	}

	public String getAdicional2() {
		return this.getFax();
	}

}
