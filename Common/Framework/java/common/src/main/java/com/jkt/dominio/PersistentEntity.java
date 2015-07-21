package com.jkt.dominio;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

import org.apache.log4j.Logger;

/**
 * Entidad base para las entidades de negocio.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
@EqualsAndHashCode(of={"id"})
abstract public class PersistentEntity implements Serializable{

	protected static final Logger log = Logger.getLogger(PersistentEntity.class);
	
	private Date creationDate;
	private long id;
	private Date modificationDate;
	private boolean activo=true;
	private int version=1;

	/*
	 * Helper methods for all entities
	 */
	/**
	 * Agrega un objeto a una coleccion, si es que no existe.
	 * 
	 * @param coleccion
	 * @param objeto
	 */
	protected void agregarObjectoAColeccion(Collection coleccion, Object objeto){
		if(!coleccion.contains(objeto)){
			coleccion.add(objeto);
		}
	}
	
	/**
	 * Elimina un objeto de una coleccion, si es que existe.
	 * 
	 * @param coleccion
	 * @param objeto
	 */
	protected void borrarObjetoDeColeccion(Collection coleccion, Object objeto) {
		if(!coleccion.contains(objeto)){
			coleccion.remove(objeto);
		}
	}
	
	/*
	 * Helper methods for all entities
	 */
	
}
