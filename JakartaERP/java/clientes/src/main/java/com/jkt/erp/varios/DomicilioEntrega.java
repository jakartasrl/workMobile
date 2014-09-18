package com.jkt.erp.varios;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

import com.jkt.dominio.PersistentEntity;
import com.jkt.varios.dominio.Direccion;
import com.jkt.varios.dominio.Provincia;

/**
 * <p>Representa los lugares en donde el cliente recibe las compras que ha realizado</p>
 * <p>Se utilizar� para definir en el pedido el  lugar en donde se debe entregar la mercaderia</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class DomicilioEntrega extends PersistentEntity {

	/*
	 * Inicio de variables de instancia
	 */
	/**
	 * El cliente/sucursal al que referencia el domicilio de entrega
	 */
	@NotNull(message="El cliente/sucursal debe no ser nulo.")
	private ClienteSucursal clienteSucursal;
	
	/**
	 * Indica el nro correlativo de domicilio de entrega
	 */
	@Min(message="El numero debe ser mayor a cero.", value=1)
	private int numero;
	
	/**
	 * Indica el nro correlative de domicilio de entrega
	 */
	@NotNull(message="La direccion no puede ser nula.")
	private Direccion direccion;
	
	/**
	 * El transporte con el que se env�a las mercader�a vendida
	 */
	private Transporte transporte;
	
	@NotBlank(message="La descripcion no puede estar vacia.")
	private String descripcion;
	
	/**
	 * Los d�as y horarios en que se permite entregar
	 */
	private String diasEntrega; 
	
	private String telefono;

	/*
	 * Fin de variables de instancia
	 */

	public ClienteSucursal getClienteSucursal() {
		return clienteSucursal;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public void setClienteSucursal(ClienteSucursal clienteSucursal) {
		this.clienteSucursal = clienteSucursal;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public Direccion getDireccion() {
		return direccion;
	}

	public void setDireccion(Direccion direccion) {
		this.direccion = direccion;
	}

	public Transporte getTransporte() {
		return transporte;
	}

	public void setTransporte(Transporte transporte) {
		this.transporte = transporte;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getDiasEntrega() {
		return diasEntrega;
	}

	public void setDiasEntrega(String diasEntrega) {
		this.diasEntrega = diasEntrega;
	}

	/*
	 * Metodos para el manejo de la direccion.
	 */
	
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
