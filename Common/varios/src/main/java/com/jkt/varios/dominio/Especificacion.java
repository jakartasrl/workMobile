package com.jkt.varios.dominio;

import java.util.Date;

import com.jkt.dominio.PersistentEntity;

/**
 * <p>Hace referencia a un archivo adjunto.</p>
 * <p>Esta clase representa a cualquier archivo, nota, factura, comprobante o demas.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Especificacion extends PersistentEntity {
	
	public Especificacion() {
		super();
		this.fechaDeSubida=new Date();
	}
	
//	public enum TipoEspecificacion { NOTA, ARCHIVO};
	
	/*
	 * Entre 'ruta de adjunto' y 'nombre' forman la ruta completa del archivo adjunto.
	 * 
	 * ruta-> c:/archivos de programas/facturas escaneadas/
	 * nombre-> factura0005.jpg
	 * 
	 * resultado-> c:/archivos de programas/facturas escaneadas/factura0005.jpg
	 * 
	 */
	private String ruta;
	private String nombre;
	
	private Date fechaDeSubida;//=new Date();
	
	private String comentario;
	
	private long identificadorDeUsuario;//Guardo el ID del usuario actual (Desde la sesion lo recuperamos.) y no la referencia al usuario.
	//No es muy seguro tener una referencia a un usuario desde un archivo cualquiera. Tener en cuenta que de ser así,
	//se podria ir desde un archivo comun y corriente al usuario, y del usuario navegar por todos los datos, incluso la password.
	private String nombreUsuario;
	
	public String getNombreUsuario() {
		return nombreUsuario;
	}

	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}

	public Date getFechaDeSubida() {
		return fechaDeSubida;
	}

	public long getIdentificadorDeUsuario() {
		return identificadorDeUsuario;
	}

	public void setIdentificadorDeUsuario(long identificadorDeUsuario) {
		this.identificadorDeUsuario = identificadorDeUsuario;
	}

	public void setFechaDeSubida(Date fechaDeSubida) {
		this.fechaDeSubida = fechaDeSubida;
	}

	public String getRuta() {
		return ruta;
	}

	public void setRuta(String ruta) {
		this.ruta = ruta;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	
	public String getNombreCompleto(){
		return ruta.concat(nombre);
	}

	public void setArchivo(String nombreCompleto){
		String[] nameSplitted = nombreCompleto.split("/");
		String nombre = nameSplitted[nameSplitted.length-1];
		this.nombre=nombre;
		this.ruta=nombreCompleto;//falta esto
	}
	
}
