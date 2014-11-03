package com.jkt.dominio;

import java.util.Date;

import com.jkt.varios.dominio.Especificacion;

/**
 * <p>Define la relacion entre un archivo y el usuario que lo subio.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class UsuarioArchivo extends PersistentEntity {

	private Usuario usuario;
	private Especificacion archivo;
	private Date fechaDeSubida;
	
	public UsuarioArchivo() {
		super();
		this.fechaDeSubida=new Date();
	}
	
	public Date getFechaDeSubida() {
		return fechaDeSubida;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Especificacion getArchivo() {
		return archivo;
	}

	public void setArchivo(Especificacion archivo) {
		this.archivo = archivo;
	}

}
