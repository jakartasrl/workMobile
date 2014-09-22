package com.jkt.erp.varios;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

import com.jkt.dominio.PersistentEntity;
import com.jkt.varios.dominio.ComponenteValor;
import com.jkt.varios.dominio.Direccion;
import com.jkt.varios.dominio.Pais;
import com.jkt.varios.dominio.Provincia;

/**
 * <p>Representa los lugares en donde el cliente recibe las compras que ha realizado</p>
 * <p>Se utilizar� para definir en el pedido el  lugar en donde se debe entregar la mercaderia</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ClienteSucursal extends PersistentEntity {

	@NotNull(message="Esta entidad debe tener un cliente.")
	private Cliente cliente;
	
	@Min(message="El numero debe ser mayor a cero.",value=1)
	private int numero;
	
	@NotBlank(message="La descripcion debe no estar vacia.")
	private String descripcion;
	
	@NotNull(message="La direccion no puede ser nula.")
	private Direccion direccion;
	
	@NotNull(message="El vendedor comercial debe estar cargado.")
	private Vendedor vendedorComercial;
	
	private Vendedor vendedorTecnico;
	
	private Representante representante;
	
	private String telefono;
	
//	@NotNull(message="Debe existir la cuenta conrriente relacionada al cliente/sucursal.")
//	private ClienteCtaCte cuentaCorriente;
	
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

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public String getDescripcion() {
		return descripcion;
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
		clasificadores.add(clienteSucursalClasificador);
	}
	
	public void addDomicilioEntrega(DomicilioEntrega domicilioEntrega){
		domiciliosDeEntrega.add(domicilioEntrega);
		domicilioEntrega.setClienteSucursal(this);
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

}
