package com.jkt.varios.dominio;

import java.sql.Timestamp;
import java.util.Calendar;

import lombok.Data;

import com.jkt.dominio.PersistentEntity;

/**
 * <p>Hace referencia a un archivo adjunto.</p>
 * <p>Esta clase representa a cualquier archivo, nota, factura, comprobante, cliente y demas.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
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
	
	private String descripcion;
	
	private Timestamp fechaDeSubida;
	
	private String comentario;
	
	
	private String contentType;
	private String format;
	
	private long identificadorDeUsuario;//Guardo el ID del usuario actual (Desde la sesion lo recuperamos.) y no la referencia al usuario.
	//No es muy seguro tener una referencia a un usuario desde un archivo cualquiera. Tener en cuenta que de ser así,
	//se podria ir desde un archivo comun y corriente al usuario, y del usuario navegar por todos los datos, incluso la password.
	private String nombreUsuario;
	
	/**
	 * 
	 * Metodo para retornar la fecha con tiempo eliminando los milisegundos.
	 * 
	 * @return fecha con siguiente formato -> 2014-10-31 15:49:07";//.0"
	 * 
	 */
	public String getFechaDeSubidaPlana(){
//		return "2014-10-31 15:49:07";//.0"
		return (this.getFechaDeSubida().toString()).substring(0, (this.getFechaDeSubida().toString()).length()-2);
//		return this.getFechaDeSubida().toString().split(".")[0];

//		return "31-10-2012 15:55:55";
//		return "2014-10-31 15:49:07";
//		return "31/10/2012 15:55:55";
//		return "31/10/2012 03:55:55 p.m.";
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
	 * FIXME Seguramente existe una mejor forma de hacer esto, al momento de investigar, cambiar por una soluci�n mas elegante.
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
