package com.jkt.util;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.jkt.excepcion.ExceptionValidacion;

//import com.jkt.framework.persistence.IPersistente;
//import com.jkt.framework.request.ISesion;

public interface MapDS extends Map{
	public Tabla   getTabla(String aName)  throws ExceptionValidacion;
	public Object  getObject(String aName) throws ExceptionValidacion;
	public String  getString(String aName) throws ExceptionValidacion;
	public Integer getInteger(String aName)throws ExceptionValidacion;
	public Long    getLong   (String aName)throws ExceptionValidacion;
	public Double  getDouble(String aName) throws ExceptionValidacion;
	public Date    getDate(String aName)   throws ExceptionValidacion;
	public Boolean getBoolean(String aVal) throws ExceptionValidacion;

	public int     getSimpleInteger(String aName)throws ExceptionValidacion;
	public long    getSimpleLong   (String aName)throws ExceptionValidacion;
	public double  getSimpleDouble(String aName) throws ExceptionValidacion;
	public boolean getSimpleBoolean(String aVal) throws ExceptionValidacion;
	
	/**
	 * Filtra de todos los valores, solamente las tablas y las devuelve.
	 * 
	 * @return Lista de tablas.
	 */
	public List<Tabla> getCollectionOfTables();

	
	/**
	 * Filtra todos los elementos dentro de campos
	 * @return
	 */
	public List<Campos> getCollectionOfCampos();

//	public IPersistente getObject(ISesion aSes, String aCampo, Class aClassName) throws ExceptionDS;
}