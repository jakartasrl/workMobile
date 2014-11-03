package com.jkt.varios.dominio;

import java.sql.Timestamp;

/**
 * Subclase de {@link Timestamp} de sql, para retornar un formato acorde a lo que esperan los clientes de este servidor.
 * FIXME Aun tengo problemas para recuperar esta entidad desde hibernate, pues no se puede desserializar.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class CustomTimesTamp extends Timestamp {

	private static final long serialVersionUID = -1253684541874741981L;

	public CustomTimesTamp(long time) {
		super(time);
	}

	public String toString(){
		return (super.toString()).substring(0, (super.toString()).length()-2);
	}
	
	
}
