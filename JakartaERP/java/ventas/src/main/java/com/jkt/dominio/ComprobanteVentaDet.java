package com.jkt.dominio;

import java.util.Arrays;
import java.util.List;

import com.jkt.cotizador.dominio.Cotizador;
import com.jkt.dominio.TipoComprobante.Comportamiento;
import com.jkt.erp.articulos.Producto;
import com.jkt.excepcion.JakartaException;
import com.jkt.varios.dominio.Moneda;
import com.jkt.varios.dominio.UnidadMedida;

public class ComprobanteVentaDet extends PersistentEntity {

	
	public static List<Container> TIPO_VENTA = Arrays.asList(new Container("1", "Fabricacion"), new Container("2", "Reparacion"), new Container("3", "Service"));
	
	private static final String SEPARADOR = " / ";

	private String descripcion;//Con esta descripcion el usuario selecciona que modelo de cotizador es el mas apropiado.
	
	private ComprobanteVenta comprobanteVenta;
	private Producto producto;
	private int cantidad=1;
	private UnidadMedida unidadMedida;
	private double precio;
	private Moneda moneda;
	private Cotizador cotizador;
	private int tipoVenta=0;
	private String referencia;
	private int estadoId;
	
	public int getEstadoId() {
		return estadoId;
	}

	public void setEstadoId(int estadoId) {
		this.estadoId = estadoId;
	}

	/**
	 * Este metodo retorna la descripcion del estado solicitado.
	 * 
	 * throw {@link JakartaException}
	 * 
	 */
	public String getDescripcionEstado() throws JakartaException{
		Estado estado = Estado.getEstado(this.estadoId);
		return estado.descripcion();
	}

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
	
	
	public enum Estado { 
		
		PENDIENTE_A_COTIZAR(1) {
			@Override
			public String descripcion() {
				return "Pendiente de Cotizar";
			}
		},
		COTIZADO_NO_AUTORIZADO(2) {
			@Override
			public String descripcion() {
				return "Cotizado pero No Autorizado";
			}

		},
		AUTORIZADO(3) {
			@Override
			public String descripcion() {
				return "Autorizado";
			}

		},
		RECHAZADO(4) {
			@Override
			public String descripcion() {
				return "Rechazado";
			}

		};
		
		private int id;
		public abstract String descripcion();

		private Estado (int id){
			this.id=id;
		}
		
		public int getId(){
			return this.id;
		}
		
		/**
		 * Obtiene un elemento de la enumeracion recibiendo un entero.
		 * 
		 */
		public static Estado getEstado(int value) throws JakartaException{
			Estado[] values = values();
			Estado e = null;
			for (Estado estado : values) {
				if(estado.getId()==value){
					e=estado;
					break; 
				}
			}
			if (e==null) {
				throw new JakartaException("No existe un Estado para la solicitud recibida.");
			}
			return e;
		}
        
	};
	
	
	public ComprobanteVentaDet() {
		this.estadoId=Estado.PENDIENTE_A_COTIZAR.getId();
	}
	
	
}
