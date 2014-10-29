package com.jkt.dominio;

import com.jkt.cotizador.dominio.Cotizador;
import com.jkt.erp.articulos.Producto;
import com.jkt.varios.dominio.Moneda;
import com.jkt.varios.dominio.UnidadMedida;

public class ComprobanteVentaDet extends PersistentEntity {

	private String descripcion;//Con esta descripcion el usuario selecciona que modelo de cotizador es el mas apropiado.
	
	private ComprobanteVenta comprobanteVenta;
	private Producto producto;
	private int cantidad=1;
	private UnidadMedida unidadMedida;
	private double precio;
	private Moneda moneda;
	private Cotizador cotizador;
	private int tipoVenta;
	
	public int getTipoVenta() {
		return tipoVenta;
	}

	public void setTipoVenta(int tipoVenta) {
		this.tipoVenta = tipoVenta;
	}

	public Cotizador getCotizador() {
		return cotizador;
	}

	public void setCotizador(Cotizador cotizador) {
		this.cotizador = cotizador;
	}

	public ComprobanteVenta getComprobanteVenta() {
		return comprobanteVenta;
	}

	public void setComprobanteVenta(ComprobanteVenta comprobanteVenta) {
		this.comprobanteVenta = comprobanteVenta;
	}

	public Producto getProducto() {
		return producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public UnidadMedida getUnidadMedida() {
		return unidadMedida;
	}

	public void setUnidadMedida(UnidadMedida unidadMedida) {
		this.unidadMedida = unidadMedida;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public Moneda getMoneda() {
		return moneda;
	}

	public void setMoneda(Moneda moneda) {
		this.moneda = moneda;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
}
