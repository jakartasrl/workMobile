package com.jkt.dominio;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

import org.apache.log4j.Logger;

/**
 * Entidad base para las entidades de negocio.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
abstract public class PersistentEntity implements Serializable{

	protected static final Logger log = Logger.getLogger(PersistentEntity.class);
	
	private long id;
	private Date creationDate;
	private Date modificationDate;
	private boolean activo=true;
	private int version;

	
	public boolean getActivo(){
		return activo;
	}
	
	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public PersistentEntity() {
		this.creationDate = new Date();
	}

	public Date getModificationDate() {
		return modificationDate;
	}

	public void setModificationDate(Date modificationDate) {
		this.modificationDate = modificationDate;
	}

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
