package com.jkt.dominio;

import java.util.ArrayList;
import java.util.List;

import com.jkt.erp.varios.Representante;
import com.jkt.erp.varios.Vendedor;

/**
 * Comprobate que representa un evento de cotizacion/pedido
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public abstract class ComprobanteVenta extends ComprobanteCliente {

	private String nombre;
	private String descripcion;

	private Vendedor vendedor;
	private Representante representante;
	private List<ComprobanteVentaDet> detalles = new ArrayList<ComprobanteVentaDet>();

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public List<ComprobanteVentaDet> getDetalles() {
		return detalles;
	}

	public void setDetalles(List<ComprobanteVentaDet> detalles) {
		this.detalles = detalles;
	}

	public Vendedor getVendedor() {
		return vendedor;
	}

	public void setVendedor(Vendedor vendedor) {
		this.vendedor = vendedor;
	}

	public Representante getRepresentante() {
		return representante;
	}

	public void setRepresentante(Representante representante) {
		this.representante = representante;
	}

}
