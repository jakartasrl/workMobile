package com.jkt.dominio;

import java.util.Arrays;
import java.util.List;

import com.jkt.cotizador.dominio.Cotizador;
import com.jkt.dominio.TipoComprobante.Comportamiento;
import com.jkt.erp.articulos.Producto;
import com.jkt.excepcion.JakartaException;
import com.jkt.varios.dominio.Moneda;
import com.jkt.varios.dominio.UnidadMedida;

/**
 * <p>Es un detalle de un comprobante de venta.</p>
 * <p>El comprobante de venta puede ser una cotizacion, un presupuesto, un pedido.</p>
 * <p>Cada tipo de comprobante definido aquí arriba, tiene sus propios detalles mapeados en diferentes tablas.</p>
 * <p>Cada detalle tendra sus atributos particulares, y obviamente al extender de la misma clase, atritutos en comun.</p>
 * <p>Los datos que se persisten dependiendo del detalle que sea, es decir, si es detalle de cotizacion o de presupuesto,
 * esta definido por el mapeo de la entidad a la base, obviamente, si en el mapeo, solamente tengo un campo mapeado, esto se refleja en la base.</p> 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ComprobanteVentaDet extends PersistentEntity {

	public static List<Container> TIPO_VENTA = Arrays.asList(new Container("1", "Fabricacion"), new Container("2", "Reparacion"), new Container("3", "Service"));
	private static final String SEPARADOR = " / ";

	private ComprobanteVenta comprobanteVenta;
	private String descripcion;//Con esta descripcion el usuario selecciona que modelo de cotizador es el mas apropiado.
	private Producto producto;
	private int cantidad=1;
	private double precio;
	private int tipoVenta=0;
	private String referencia;

	/*
	 * Helper methods
	 */
	public String getDescripcionTipoDeVenta(){
		for (Container container : TIPO_VENTA) {
			if (Integer.valueOf(container.getCodigo())==this.tipoVenta) {
				return container.getDescripcion();
			}
		}
		return "";
	}
	
	public String getDescClieSucu() {
		return comprobanteVenta.getClienteSucursal().getCliente().getSujetoImpositivo().getRazonSocial().
				concat(SEPARADOR).concat(String.valueOf(comprobanteVenta.getClienteSucursal().getNumero()));
	}
	/*
	 * Helper methods
	 */
	
	/*
	 * Campo transiente
	 */
	private String numero;

	public String getNumero() {
		return numero;
	}
	
	public void setNumero(String numero) {
		this.numero = numero;
	}
	/*
	 * Campo transiente
	 */
	
	public String getReferencia() {
		return referencia;
	}

	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}

	public int getTipoVenta() {
		return tipoVenta;
	}

	public void setTipoVenta(int tipoVenta) {
		this.tipoVenta = tipoVenta;
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

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	/*
	 * Transiente campo para retornar el total una vez que fue cotizado.
	 */
	private double totalCotizado;
	public double getTotalCotizado() {
		return totalCotizado;
	}
	public void setTotalCotizado(double totalCotizado) {
		this.totalCotizado = totalCotizado;
	}
	
}
