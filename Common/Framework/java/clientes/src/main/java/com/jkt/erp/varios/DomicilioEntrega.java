package com.jkt.erp.varios;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

import com.jkt.dominio.PersistentEntity;
import com.jkt.varios.dominio.Direccion;

/**
 * <p>Representa los lugares en donde el cliente recibe las compras que ha realizado</p>
 * <p>Se utilizará para definir en el pedido el  lugar en donde se debe entregar la mercaderia</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class DomicilioEntrega extends PersistentEntity {

	private static final long serialVersionUID = 2094317297861077431L;

	/*
	 * Inicio de variables de instancia
	 */
	/**
	 * El cliente/sucursal al que referencia el domicilio de entrega
	 */
	@NotNull
	private ClienteSucursal clienteSucursal;
	
	/**
	 * Indica el nro correlative de domicilio de entrega
	 */
	@Min(1)
	private int numero;
	
	/**
	 * Indica el nro correlative de domicilio de entrega
	 */
	@NotNull
	private Direccion direccion;
	
	/**
	 * El transporte con el que se envía las mercadería vendida
	 */
	private Transporte transporte;
	
	@NotBlank
	private String descripcion;
	
	/**
	 * Los días y horarios en que se permite entregar
	 */
	private String diasEntrega; 

	/*
	 * Fin de variables de instancia
	 */
	
	public ClienteSucursal getClienteSucursal() {
		return clienteSucursal;
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

	
	
}
