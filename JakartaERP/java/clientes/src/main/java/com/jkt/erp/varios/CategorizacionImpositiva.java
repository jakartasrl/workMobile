package com.jkt.erp.varios;

import java.util.Date;

import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.impuestos.dominio.CategoriaImpuesto;

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
