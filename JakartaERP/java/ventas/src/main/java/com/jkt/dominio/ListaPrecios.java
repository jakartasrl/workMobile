package com.jkt.dominio;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.jkt.varios.dominio.Moneda;

/**
 * <p>Una lista de precio es una lista que contiene detalles las cuales brindan informacion sobre productos y sus costos.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ListaPrecios extends Descriptible {

	private Date fechaVigenciaDesde;
	private Date fechaVigenciaHasta;
	private Moneda moneda;
	private List<ListaPrecioDetalle> detalles=new ArrayList<ListaPrecioDetalle>();
	
	public void agregarDetalle(ListaPrecioDetalle detalle){
		if (!this.detalles.contains(detalle)) {
			this.detalles.add(detalle);
			detalle.setListaPrecios(this);
		}
	}
	
	public List<ListaPrecioDetalle> getDetalles() {
		return detalles;
	}

	public void setDetalles(List<ListaPrecioDetalle> detalles) {
		this.detalles = detalles;
	}

	public Date getFechaVigenciaDesde() {
		return fechaVigenciaDesde;
	}

	public void setFechaVigenciaDesde(Date fechaVigenciaDesde) {
		this.fechaVigenciaDesde = fechaVigenciaDesde;
	}

	public Date getFechaVigenciaHasta() {
		return fechaVigenciaHasta;
	}

	public void setFechaVigenciaHasta(Date fechaVigenciaHasta) {
		this.fechaVigenciaHasta = fechaVigenciaHasta;
	}

	public Moneda getMoneda() {
		return moneda;
	}

	public void setMoneda(Moneda moneda) {
		this.moneda = moneda;
	}

}
