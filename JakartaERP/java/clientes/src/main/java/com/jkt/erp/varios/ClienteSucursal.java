package com.jkt.erp.varios;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

import com.jkt.dominio.IDescriptible;
import com.jkt.dominio.IDetalle;
import com.jkt.dominio.PersistentEntity;
import com.jkt.varios.dominio.Contacto;
import com.jkt.varios.dominio.Direccion;
import com.jkt.varios.dominio.Pais;
import com.jkt.varios.dominio.Provincia;

/**
 * <p>Representa los lugares en donde el cliente recibe las compras que ha realizado</p>
 * <p>Se utilizarÃ¡ para definir en el pedido el  lugar en donde se debe entregar la mercaderia</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ClienteSucursal extends PersistentEntity implements IDetalle, IDescriptible{

	@NotNull(message="Esta entidad debe tener un cliente.")
	private Cliente cliente;
	
//	@Min(message="El Nro. Sucursal debe ser mayor o igual a cero.", value=0)
	private String numero;
	
	@NotBlank(message="La descripcion debe no estar vacia.")
	private String descripcion;
	
	@NotNull(message="La direccion no puede ser nula.")
	private Direccion direccion;
	
	@NotNull(message="El vendedor comercial debe estar cargado.")
	private Vendedor vendedorComercial;
	
	private Vendedor vendedorTecnico;
	
	private Representante representante;
	
	private String telefono;
	
	private String domicilioEntregaDeFactura;
	
	/**
	 * Contactos en la sucursal
	 */
	private List<Contacto> contactos=new ArrayList<Contacto>();
	
	private List<ClienteSucursalClasificador> clasificadores=new ArrayList<ClienteSucursalClasificador>(); 

	/**
	 * Los distintos domicilios de entrega de la sucursal
	 */
	@NotEmpty(message="Debe como minimo existir un domicilio de entrega.")
	private List<DomicilioEntrega> domiciliosDeEntrega=new ArrayList<DomicilioEntrega>();

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	
	public String getDomicilioEntregaDeFactura() {
		return domicilioEntregaDeFactura;
	}

	public void setDomicilioEntregaDeFactura(String domicilioEntregaDeFactura) {
		this.domicilioEntregaDeFactura = domicilioEntregaDeFactura;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Direccion getDireccion() {
		return direccion;
	}

	public void setDireccion(Direccion direccion) {
		this.direccion = direccion;
	}

	public Vendedor getVendedorComercial() {
		return vendedorComercial;
	}

	public void setVendedorComercial(Vendedor vendedorComercial) {
		this.vendedorComercial = vendedorComercial;
	}

	public Vendedor getVendedorTecnico() {
		return vendedorTecnico;
	}

	public void setVendedorTecnico(Vendedor vendedorTecnico) {
		this.vendedorTecnico = vendedorTecnico;
	}

	public Representante getRepresentante() {
		return representante;
	}

	public void setRepresentante(Representante representante) {
		this.representante = representante;
	}

	public List<ClienteSucursalClasificador> getClasificadores() {
		return clasificadores;
	}

	public void setClasificadores(List<ClienteSucursalClasificador> clasificadores) {
		this.clasificadores = clasificadores;
	}

	public List<Contacto> getContactos() {
		return contactos;
	}

	public void setContactos(List<Contacto> contactos) {
		this.contactos = contactos;
	}

	public List<DomicilioEntrega> getDomiciliosDeEntrega() {
		return domiciliosDeEntrega;
	}

	public void setDomiciliosDeEntrega(List<DomicilioEntrega> domiciliosDeEntrega) {
		this.domiciliosDeEntrega = domiciliosDeEntrega;
	}
	
	public String getTelefono() {
		return telefono;
	}
	
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	/*
	 * Helper methods
	 */
	public void addClasificador(ClienteSucursalClasificador clienteSucursalClasificador){
		if (clienteSucursalClasificador!=null && clienteSucursalClasificador.getComponenteValor()!=null) {
			if(!clasificadores.contains(clienteSucursalClasificador)){
				clasificadores.add(clienteSucursalClasificador);
				clienteSucursalClasificador.setClienteSucursal(this);
			}
		}
	}
	
	public void addDomicilioEntrega(DomicilioEntrega domicilioEntrega){
		if (!domiciliosDeEntrega.contains(domicilioEntrega)) {
			domiciliosDeEntrega.add(domicilioEntrega);
			domicilioEntrega.setClienteSucursal(this);
		}
	}
	
	public void addContacto(Contacto c){
		agregarObjectoAColeccion(contactos, c);
	}

	public void deleteContacto(Contacto c){
		borrarObjetoDeColeccion(contactos, c);
	}

	/*
	 * Helper methods
	 */
	
	
	/*
	 * Metodos para el manejo de la direccion.
	 */
	
	public void setearPais(Pais pais){
		generarDireccion();
		this.direccion.setPais(pais);
	}
	
	public void setearProvincia(Provincia provincia){
		generarDireccion();
		this.direccion.setProvincia(provincia);
	}
	
	public void setearDireccion(String direccion){
		generarDireccion();
		this.direccion.setDireccion(direccion);
	}

	public void setearLocalidad(String localidad){
		generarDireccion();
		this.direccion.setLocalidad(localidad);
	}
	
	
	public void setearCodPostal(String cp){
		generarDireccion();
		this.direccion.setCodigoPostal(cp);
	}
	
	private void generarDireccion(){
		if (this.direccion==null) {
			this.direccion=new Direccion();
		}
	}
	/*
	 * Metodos para el manejo de la direccion.
	 */

	public String getNombreDeMaestro() {
		return "cliente";
	}

	public String getCodigo() {
		return String.valueOf(this.getNumero());
	}

	public String getDescripcionCompleta(){
		return this.cliente.getDescripcion().concat("/").concat(this.descripcion);
	}

	public String getAdicional1() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getAdicional2() {
		// TODO Auto-generated method stub
		return null;
	}

}
