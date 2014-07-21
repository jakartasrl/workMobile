package com.jkt.dominio;

/**
 * Representa a una empresa dentro del sistema.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Empresa extends PersistentEntity {

	private String codigo;
	private String razonSocial;
	private String urlDB;
	private boolean activo=true;

	/**
	 * El parser hecho anteriormente no se encargaba de los atributos booleanos,
	 * asiq es un parche temporal, Luego se verá que se hace... FIXME TODO
	 * 
	 * @return
	 */
	public boolean getActivo() {
		return isActivo();
	}

	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
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

}
