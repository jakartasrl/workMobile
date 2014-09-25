package com.jkt.dominio;

/**
 * Clase que representa un acceso de un usuario.
 * Cada instancia deberá ser persistida a modo de una auditoria
 *
 * @author Leonel Suarez - Jakarta SRL
 */
public class Login extends PersistentEntity {

	private String usuario, password;

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
