package com.jkt.varios.dominio;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

import com.jkt.dominio.PersistentEntity;

/**
 * <p>Hace referencia a un archivo adjunto.</p>
 * <p>Esta clase representa a cualquier archivo, nota, factura, comprobante o demas.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Especificacion extends PersistentEntity {
	
	private static final String SEPARADOR = "\\\\";
	private static final String SEPARADOR_PARA_CREACION = "\\";

	public Especificacion() {
		super();
		Calendar calendar = Calendar.getInstance();
		this.fechaDeSubida= new java.sql.Timestamp(calendar.getTime().getTime());
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
	
	private Timestamp fechaDeSubida;
	
	private String comentario;
	
	private int identificadorDeUsuario;//Guardo el ID del usuario actual (Desde la sesion lo recuperamos.) y no la referencia al usuario.
	//No es muy seguro tener una referencia a un usuario desde un archivo cualquiera. Tener en cuenta que de ser así,
	//se podria ir desde un archivo comun y corriente al usuario, y del usuario navegar por todos los datos, incluso la password.
	private String nombreUsuario;
	
	public String getNombreUsuario() {
		return nombreUsuario;
	}

	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}

	public Timestamp getFechaDeSubida() {
		return fechaDeSubida;
	}
	
	public String getFechaDeSubidaPlana(){
//		return "2014-10-31 15:49:07";//.0"
		return (this.getFechaDeSubida().toString()).substring(0, (this.getFechaDeSubida().toString()).length()-2);
//		return this.getFechaDeSubida().toString().split(".")[0];

//		return "31-10-2012 15:55:55";
//		return "2014-10-31 15:49:07";
//		return "31/10/2012 15:55:55";
//		return "31/10/2012 03:55:55 p.m.";
	}
	

	public void setFechaDeSubida(Timestamp fechaDeSubida) {
		this.fechaDeSubida = fechaDeSubida;
	}

	public int getIdentificadorDeUsuario() {
		return identificadorDeUsuario;
	}

	public void setIdentificadorDeUsuario(int identificadorDeUsuario) {
		this.identificadorDeUsuario = identificadorDeUsuario;
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
	
	/**
	 * <p>Devuelve el nombre completo del archivo.Toma la ruta y el nombre y lo retorna con un formato correctamente legible desde el cliente.</p>
	 * @return String nombre completo (URI) del archivo.
	 */
	public String getNombreCompleto(){
		return ruta.concat(nombre);
	}

	/**
	 * <p>Recibe el nombre completo y genera dos textos separados, la ruta completa del archivo, y el nombre con extension.</p>
	 * FIXME Seguramente existe una mejor forma de hacer esto, al momento de investigar, cambiar por una solución mas elegante.
	 * 
	 */
	public void setNombreCompleto(String nombreCompleto){
		String[] nameSplitted = nombreCompleto.split(SEPARADOR);
		String nombre = nameSplitted[nameSplitted.length-1];
		this.nombre=nombre;

		String ruta = nameSplitted[0].concat(SEPARADOR_PARA_CREACION);
		for(int i=1; i<nameSplitted.length-1; i++){
			ruta+=nameSplitted[i].concat(SEPARADOR_PARA_CREACION);
		}
		
		this.ruta=ruta;
	}
	
}
