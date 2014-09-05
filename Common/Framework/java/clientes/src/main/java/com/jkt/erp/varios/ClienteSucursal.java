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

/**
 * <p>Representa los lugares en donde el cliente recibe las compras que ha realizado</p>
 * <p>Se utilizará para definir en el pedido el  lugar en donde se debe entregar la mercaderia</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ClienteSucursal extends PersistentEntity {

	private static final long serialVersionUID = 7007220789644015327L;

	@NotNull
	private Cliente cliente;
	
	@Min(1)
	private int numero;
	
	@NotBlank
	private String descripcion;
	
	@NotNull
	private Direccion direccion;
	
	@NotNull
	private Vendedor vendedorComercial;
	
	private Vendedor vendedorTecnico;
	
	private Representante representante;
	
	private ClienteCtaCte cuentaCorriente;
	
	/**
	 * Contactos en la sucursal
	 */
	private List<Contacto> contactos=new ArrayList<Contacto>();
	
	private List<ComponenteValor> clasificadores=new ArrayList<ComponenteValor>(); 

	/**
	 * Los distintos domicilios de entrega de la sucursal
	 */
	@NotEmpty
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

	public ClienteCtaCte getCuentaCorriente() {
		return cuentaCorriente;
	}

	public void setCuentaCorriente(ClienteCtaCte cuentaCorriente) {
		this.cuentaCorriente = cuentaCorriente;
	}

	public List<Contacto> getContactos() {
		return contactos;
	}

	public void setContactos(List<Contacto> contactos) {
		this.contactos = contactos;
	}

	public List<ComponenteValor> getClasificadores() {
		return clasificadores;
	}

	public void setClasificadores(List<ComponenteValor> clasificadores) {
		this.clasificadores = clasificadores;
	}

	public List<DomicilioEntrega> getDomiciliosDeEntrega() {
		return domiciliosDeEntrega;
	}

	public void setDomiciliosDeEntrega(List<DomicilioEntrega> domiciliosDeEntrega) {
		this.domiciliosDeEntrega = domiciliosDeEntrega;
	}
	
	
	/*
	 * Helper methods
	 */
	public void addContacto(Contacto c){
		agregarObjectoAColeccion(contactos, c);
	}

	public void addValorClasificador(ComponenteValor c){
		agregarObjectoAColeccion(clasificadores, c);
	}
	
	public void deleteContacto(Contacto c){
		borrarObjetoDeColeccion(contactos, c);
	}

	public void deleteValorClasificador(ComponenteValor c){
		borrarObjetoDeColeccion(clasificadores, c);
	}
	
	/*
	 * Helper methods
	 */

}
