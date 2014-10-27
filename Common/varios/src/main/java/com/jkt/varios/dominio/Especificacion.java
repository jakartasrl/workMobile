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
	 * ruta-> c:/archivos de programas/facturas escaneadas
	 * nombre-> factura0005.jpg
	 * 
	 * resultado-> c:/archivos de programas/facturas escaneadas/factura0005.jpg
	 * 
	 */
	private String ruta;
	private String nombre;
	private Date fechaDeSubida;//=new Date();
	
	private String comentario;
	
//	private TipoEspecificacion tipo;
	
	public Date getFechaDeSubida() {
		return fechaDeSubida;
	}

	public void setFechaDeSubida(Date fechaDeSubida) {
		this.fechaDeSubida = fechaDeSubida;
	}

//	public TipoEspecificacion getTipo() {
//		return tipo;
//	}
//
//	public void setTipo(TipoEspecificacion tipo) {
//		this.tipo = tipo;
//	}
//
//	public void setTIpo(String tipo){
//		this.tipo=TipoEspecificacion.valueOf(tipo);
//	}
//	
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

	
}
