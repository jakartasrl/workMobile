package com.jkt.erp.varios;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

import com.jkt.dominio.PersistentEntity;
import com.jkt.erp.impuestos.dominio.CategoriaImpuesto;
import com.jkt.erp.impuestos.dominio.Impuesto;

/**
 * <p>Representa las inscripciones en cada impuesto que tiene el sujeto impositivo</p>
 * <p>Se utilizara para el calculo de impuestos y retenciones en facturas, y pagos</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class InscripcionImpositiva extends PersistentEntity {

	/*
	 * ************************************************************************************************************
	 * Variables de instancia
	 */
	
	@NotNull(message="El sujeto impositivo debe estar cargado.")
	private SujetoImpositivo sujetoImpositivo;
	
	private Impuesto impuesto;
	private String numero;
	
	private Date fechaInscripcion;
	
	private CategoriaImpuesto categoria;
	private Date fechaVigencia;

	private List<CategorizacionImpositiva> categorizacionImpositiva=new ArrayList<CategorizacionImpositiva>();

	/*
	 * Variables de instancia
	 * ************************************************************************************************************
	 */
	
	
	/*
	 * Variables transientes
	 */
//	private CategoriaImpuesto categoria;
//	private Date fechaVigencia;
//	
	public CategoriaImpuesto getCategoria() {
		return categoria;
	}
	
	public void setCategoria(CategoriaImpuesto categoria) {
		this.categoria = categoria;
	}
	
	public Date getFechaVigencia() {
		return fechaVigencia;
	}
	
	public void setFechaVigencia(Date fechaVigencia) {
		this.fechaVigencia = fechaVigencia;
	}
	/*
	 * Variables transientes
	 */
	
	public List<CategorizacionImpositiva> getCategorizacionImpositiva() {
		return categorizacionImpositiva;
	}

	public void setCategorizacionImpositiva(
			List<CategorizacionImpositiva> categorizacionImpositiva) {
		this.categorizacionImpositiva = categorizacionImpositiva;
	}

	public SujetoImpositivo getSujetoImpositivo() {
		return sujetoImpositivo;
	}

	public void setSujetoImpositivo(SujetoImpositivo sujetoImpositivo) {
		this.sujetoImpositivo = sujetoImpositivo;
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

	public Impuesto getImpuesto() {
		return impuesto;
	}

	public void setImpuesto(Impuesto impuesto) {
		this.impuesto = impuesto;
	}


}
