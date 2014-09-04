package com.jkt.dominio;

import org.hibernate.validator.constraints.NotBlank;

/**
 * Representa a una empresa dentro del sistema.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Empresa extends PersistentEntity implements IDescriptible {

	@NotBlank
	private String codigo;

	@NotBlank
	private String razonSocial;

	private String urlDB;

	// Transient value!
	private String oidUsuario;

	public String getOidUsuario() {
		return oidUsuario;
	}

	public void setOidUsuario(String oidUsuario) {
		this.oidUsuario = oidUsuario;
	}

	/**
	 * El parser hecho anteriormente no se encargaba de los atributos booleanos,
	 * asiq es un parche temporal, Luego se verá que se hace... FIXME TODO
	 * 
	 * @return
	 */
	public boolean getActivo() {
		return isActivo();
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getRazonSocial() {
		return razonSocial;
	}

	public void setRazonSocial(String razonSocial) {
		this.razonSocial = razonSocial;
	}

	public String getUrlDB() {
		return urlDB;
	}

	public void setUrlDB(String urlDB) {
		this.urlDB = urlDB;
	}

	
	/*
	 * METODOS DE LA INTERFACE DESCRIPTIBLE
	 * 
	 * 
	 */
	
	public String getCadena() {
		return getRazonSocial();
	}

	public String getCadena2() {
		return getUrlDB();
	}

	public int getEntero() {
		return 0;
	}

	public int getEntero2() {
		return 0;
	}

	public float getFloat() {
		return 0;
	}

	public float getFloat2() {
		return 0;
	}

}
