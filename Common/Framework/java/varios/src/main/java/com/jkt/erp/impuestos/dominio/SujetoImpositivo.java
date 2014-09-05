package com.jkt.erp.impuestos.dominio;

import java.util.List;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

import com.jkt.dominio.PersistentEntity;
import com.jkt.varios.dominio.Direccion;

/**
 * <p>Representa los Sujetos Impositivos (clientes / proveedores y todo aquel que tenga CUIT)</p>
 * <p>Se utilizará para agrupar clientes y proveedores que son realmente la misma empresa desde lo impositivo.</p>
 * @author Leonel Suarez - Jakarta SRL
 */
public class SujetoImpositivo extends PersistentEntity {

	private static final long serialVersionUID = 1647999981281780385L;
	
	
	/*
	 * ********************************************************************************************
	 * Variables de instancia
	 * 
	 */
	@NotBlank
	private String razonSocial;
	
	/**
	 * Fisica o juridica
	 */
	private boolean personaJuridica;
	
	@NotNull
	private Direccion direccionLegal;
	
	private boolean local;
	
	private String cuit;
	
	private List<InscripcionesImpositivas> incripcionesImpositivas;

	/*
	 * Variables de instancia
	 * ********************************************************************************************
	 */

	public String getRazonSocial() {
		return razonSocial;
	}

	public void setRazonSocial(String razonSocial) {
		this.razonSocial = razonSocial;
	}

	public boolean isPersonaJuridica() {
		return personaJuridica;
	}

	public void setPersonaJuridica(boolean personaJuridica) {
		this.personaJuridica = personaJuridica;
	}

	public Direccion getDireccionLegal() {
		return direccionLegal;
	}

	public void setDireccionLegal(Direccion direccionLegal) {
		this.direccionLegal = direccionLegal;
	}

	public boolean isLocal() {
		return local;
	}

	public void setLocal(boolean local) {
		this.local = local;
	}

	public String getCuit() {
		return cuit;
	}

	public void setCuit(String cuit) {
		this.cuit = cuit;
	}

	public List<InscripcionesImpositivas> getIncripcionesImpositivas() {
		return incripcionesImpositivas;
	}

	public void setIncripcionesImpositivas(
			List<InscripcionesImpositivas> incripcionesImpositivas) {
		this.incripcionesImpositivas = incripcionesImpositivas;
	}

	
	
}
