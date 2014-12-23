package com.jkt.erp.varios;

import java.util.Date;

import com.jkt.dominio.Descriptible;
import com.jkt.varios.dominio.Moneda;

public class ListaPrecios extends Descriptible {

	private Date fechaVigenciaDesde;
	private Date fechaVigenciaHasta;
	private Moneda moneda;

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
