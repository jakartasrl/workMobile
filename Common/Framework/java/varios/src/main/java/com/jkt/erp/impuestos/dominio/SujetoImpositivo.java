package com.jkt.erp.impuestos.dominio;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;
import javax.websocket.ClientEndpoint;

import org.hibernate.validator.constraints.NotBlank;

import com.jkt.dominio.PersistentEntity;
import com.jkt.varios.dominio.Direccion;
import com.jkt.varios.dominio.Pais;
import com.jkt.varios.dominio.Provincia;

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
	
	@NotBlank(message="La razon social no puede ser vacia.")
	private String razonSocial;
	
	/**
	 * Fisica o juridica
	 */
	private boolean personaJuridica;
	
	@NotNull(message="Debe completar la direccion legal.")
	private Direccion direccionLegal;
	
	private boolean local;
	
	private String cuit;
	
	private List<InscripcionImpositiva> inscripcionesImpositivas=new ArrayList<InscripcionImpositiva>();

	/*
	 * Variables de instancia
	 * ********************************************************************************************
	 */

	public String getRazonSocial() {
		return razonSocial;
	}

	public List<InscripcionImpositiva> getInscripcionesImpositivas() {
		return inscripcionesImpositivas;
	}

	public void setInscripcionesImpositivas(
			List<InscripcionImpositiva> inscripcionesImpositivas) {
		this.inscripcionesImpositivas = inscripcionesImpositivas;
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

	
	/*
	 * Helper methods
	 */

	public void addInscripcionImpositiva(InscripcionImpositiva inscripcion){
		agregarObjectoAColeccion(inscripcionesImpositivas, inscripcion);
	}
	
	/*
	 * Helper methods
	 */

	
	/*
	 * Metodos para el manejo de la direccion.
	 */
	
	public void setearProvincia(Provincia provincia){
		generarDireccion();
		this.direccionLegal.setProvincia(provincia);
	}
	
	public void setearPais(Pais pais){
		generarDireccion();
		this.direccionLegal.setPais(pais);
	}
	
	public void setearDireccion(String direccion){
		generarDireccion();
		this.direccionLegal.setDireccion(direccion);
	}

	public void setearLocalidad(String localidad){
		generarDireccion();
		this.direccionLegal.setLocalidad(localidad);
	}
	
	
	public void setearCodPostal(String cp){
		generarDireccion();
		this.direccionLegal.setCodigoPostal(cp);
	}
	
	private void generarDireccion(){
		if (this.direccionLegal==null) {
			this.direccionLegal=new Direccion();
		}
	}
	/*
	 * Metodos para el manejo de la direccion.
	 */
	
	
}
