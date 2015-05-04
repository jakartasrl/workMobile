package com.jkt.pedido.dominio;

import com.jkt.dominio.Comprobante;
import com.jkt.presupuesto.dominio.Presupuesto;

/**
 * <p>Representa un trabajo que puede ser emitido directamente desde un pedido, o por medio de otra orden de fabricaci�n.</p>
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class OrdenFabricacion extends Comprobante {

	private String descripcion;
	private String sector;
	private Estado estado=Estado.TRABAJANDO;
//	private Pedido pedidoAsociado; //Es comprobanteRelacionado de la entidad Comprobante
	private OrdenFabricacion ordenAsociada;
	private int estadoId=Estado.TRABAJANDO.getId();
	
	public enum Estado { 

		TRABAJANDO(1) {
			@Override
			public String descripcion() {
				return "Trabajando sobre la orden.";
			}
		},
		ANULADO(2) {
			@Override
			public String descripcion() {
				return "Orden de fabricaci�n anulada.";
			}
		},
		COMPLETO(3) {
			@Override
			public String descripcion() {
				return "Orden de fabricaci�n finalizada.";
			}
		};

		private Estado(int id) {
			this.id=id;
		}
		
		private int id;
		public abstract String descripcion();
		
		public int getId() {
			return id;
		}
		
	}

	/*
	 * Getters & setters
	 */
	public int getEstadoId() {
		return estadoId;
	}

	public void setEstadoId(int estadoId) {
		this.estadoId = estadoId;
	}

	public String getSector() {
		return sector;
	}

	public void setSector(String sector) {
		this.sector = sector;
	}

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	public OrdenFabricacion getOrdenAsociada() {
		return ordenAsociada;
	}

	public void setOrdenAsociada(OrdenFabricacion ordenAsociada) {
		this.ordenAsociada = ordenAsociada;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public void setComprobanteRelacionado(Pedido comprobanteRelacionado) {
		this.comprobanteRelacionado = comprobanteRelacionado;
	}
	
}