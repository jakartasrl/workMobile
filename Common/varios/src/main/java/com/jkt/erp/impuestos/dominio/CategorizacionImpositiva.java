package com.jkt.erp.impuestos.dominio;

import java.util.Date;

import com.jkt.dominio.PersistentEntity;

public class CategorizacionImpositiva extends PersistentEntity {

	/*
	 * ******************************************************************************
	 * Variables de instancia
	 */
	
	private InscripcionImpositiva inscripcionImpositiva;
	private Date fechaDesde;
	private CategoriaImpuesto categoriaImpositiva;

	/*
	 * Variables de instancia
	 * ******************************************************************************
	 */
	
	
	public Date getFechaDesde() {
		return fechaDesde;
	}
	public InscripcionImpositiva getInscripcionImpositiva() {
		return inscripcionImpositiva;
	}
	public void setInscripcionImpositiva(InscripcionImpositiva inscripcionImpositiva) {
		this.inscripcionImpositiva = inscripcionImpositiva;
	}
	public void setFechaDesde(Date fechaDesde) {
		this.fechaDesde = fechaDesde;
	}
	public CategoriaImpuesto getCategoriaImpositiva() {
		return categoriaImpositiva;
	}
	public void setCategoriaImpositiva(CategoriaImpuesto categoriaImpositiva) {
		this.categoriaImpositiva = categoriaImpositiva;
	}

}
