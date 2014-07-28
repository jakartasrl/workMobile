package com.jkt.dominio;

/**
 * 
 * Entidad no persistente para enviar datos y facilitar el manejo de formularios
 * desde el cliente delphi.
 * 
 * @author ssuarez
 * 
 */
public class UsuarioEmpresa {

	private String oidUsuario, oidEmpresa, codigo, razonSocial;
	private boolean activo;

	/**
	 * TODO FIXME Parche para solicionar que quedo pendiente de lo heredado de jakartasrl anteriormente. Leo Suarez. Arreglar este bug.
	 * @return
	 */
	public boolean getActivo(){
		return isActivo();
	}
	
	public String getOidUsuario() {
		return oidUsuario;
	}

	public void setOidUsuario(String oidUsuario) {
		this.oidUsuario = oidUsuario;
	}

	public String getOidEmpresa() {
		return oidEmpresa;
	}

	public void setOidEmpresa(String oidEmpresa) {
		this.oidEmpresa = oidEmpresa;
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

	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}

}
