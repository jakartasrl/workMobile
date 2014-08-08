package com.jkt.dominio;

import java.io.Serializable;
import java.util.Date;

/**
 * Entidad base para las entidades de negocio.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
abstract public class PersistentEntity implements Serializable {

	private long id;
	private Date creationDate;
	private Date modificationDate;
	
	private int version;
	private boolean activo = true;

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

}
