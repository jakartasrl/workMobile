package com.jkt.erp.impuestos.dominio;

import java.sql.Date;

import javax.validation.constraints.NotNull;

import com.jkt.dominio.PersistentEntity;

/**
 * <p>Representa las inscripciones en cada impuesto que tiene el sujeto impositivo</p>
 * <p>Se utilizará para el calculo de impuestos y retenciones en facturas, y pagos</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class InscripcionImpositiva extends PersistentEntity {

	private static final long serialVersionUID = -409178696744353678L;

	@NotNull
	private SujetoImpositivo sujetoImpositivo;
	
	private Impuesto impuesto;
	private String numero;
	
	private Date fechaInscripcion;
	
	private CategoriaImpuesto categoriaActual;

	public SujetoImpositivo getSujetoImpositivo() {
		return sujetoImpositivo;
	}

	public void setSujetoImpositivo(SujetoImpositivo sujetoImpositivo) {
		this.sujetoImpositivo = sujetoImpositivo;
	}

	public Impuesto getImpuesto() {
		return impuesto;
	}

	public void setImpuesto(Impuesto impuesto) {
		this.impuesto = impuesto;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public Date getFechaInscripcion() {
		return fechaInscripcion;
	}

	public void setFechaInscripcion(Date fechaInscripcion) {
		this.fechaInscripcion = fechaInscripcion;
	}

	public CategoriaImpuesto getCategoriaActual() {
		return categoriaActual;
	}

	public void setCategoriaActual(CategoriaImpuesto categoriaActual) {
		this.categoriaActual = categoriaActual;
	}
	
	

}
