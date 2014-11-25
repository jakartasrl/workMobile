package com.jkt.cotizador.dominio;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.jkt.dominio.PersistentEntity;
import com.jkt.varios.dominio.Moneda;

/**
 * <p>Entidad que se encarga de cotizar un presupuestos.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Cotizador extends PersistentEntity {

	private Date fecha;
	private boolean revisado;
	private String usuarioCreacion;
	
	private Moneda monedaExpresada;
	private String usuarioRevision;
	private Date fechaRevision;
	private ModeloCotizador modelo;
	private List<CotizadorDet> detalles=new ArrayList<CotizadorDet>();

	public Cotizador() {
		this.fecha=new Date();
		this.revisado=false;
		this.usuarioCreacion="User not assigned yet. Value setted ";
	}
	
	public void agregarDetalle(CotizadorDet detalle){
		if (!detalles.contains(detalle)) {
			detalles.add(detalle);
			detalle.setCotizador(this);
		}
	}
	
	public Moneda getMonedaExpresada() {
		return monedaExpresada;
	}

	public void setMonedaExpresada(Moneda monedaExpresada) {
		this.monedaExpresada = monedaExpresada;
	}

	public List<CotizadorDet> getDetalles() {
		return detalles;
	}
	public void setDetalles(List<CotizadorDet> detalles) {
		this.detalles = detalles;
	}
	public ModeloCotizador getModelo() {
		return modelo;
	}
	public void setModelo(ModeloCotizador modelo) {
		this.modelo = modelo;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public boolean isRevisado() {
		return revisado;
	}
	public void setRevisado(boolean revisado) {
		this.revisado = revisado;
	}
	public String getUsuarioCreacion() {
		return usuarioCreacion;
	}
	public void setUsuarioCreacion(String usuarioCreacion) {
		this.usuarioCreacion = usuarioCreacion;
	}
	public String getUsuarioRevision() {
		return usuarioRevision;
	}
	public void setUsuarioRevision(String usuarioRevision) {
		this.usuarioRevision = usuarioRevision;
	}
	public Date getFechaRevision() {
		return fechaRevision;
	}
	public void setFechaRevision(Date fechaRevision) {
		this.fechaRevision = fechaRevision;
	}
	
}
