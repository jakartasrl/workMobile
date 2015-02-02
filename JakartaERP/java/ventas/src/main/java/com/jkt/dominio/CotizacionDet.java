package com.jkt.dominio;

import com.jkt.cotizador.dominio.Cotizador;
import com.jkt.excepcion.JakartaException;
import com.jkt.varios.dominio.Moneda;
import com.jkt.varios.dominio.UnidadMedida;

/**
 * <p>Son los detalles de una cotizacion.</p>
 * <p>Al momento de crear una cotizacion, se generan N items.</p>
 * <p>Cada uno de estos items es una instancia de esta clase.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class CotizacionDet extends ComprobanteVentaDet {

	private Cotizador cotizador;
//	private UnidadMedida unidadMedida;
//	private Moneda moneda;

//	public UnidadMedida getUnidadMedida() {
//		return unidadMedida;
//	}
//
//	public void setUnidadMedida(UnidadMedida unidadMedida) {
//		this.unidadMedida = unidadMedida;
//	}
//
//	public Moneda getMoneda() {
//		return moneda;
//	}
//
//	public void setMoneda(Moneda moneda) {
//		this.moneda = moneda;
//	}


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
	
	public Cotizador getCotizador() {
		return cotizador;
	}

	public void setCotizador(Cotizador cotizador) {
		this.cotizador = cotizador;
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
	

	public CotizacionDet() {
		this.estadoId=Estado.PENDIENTE_A_COTIZAR.getId();
	}
	
	
}
