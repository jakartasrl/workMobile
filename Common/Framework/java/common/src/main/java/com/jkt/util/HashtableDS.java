package com.jkt.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.collections.Closure;
import org.apache.commons.collections.CollectionUtils;

import com.jkt.excepcion.ExceptionDS;
import com.jkt.excepcion.ExceptionValidacion;

//import com.jkt.framework.da.IObjectServer;
//import com.jkt.framework.persistence.IPersistente;
//import com.jkt.framework.request.ISesion;
/**
 * Description: Esta clase, es la que encierra los valores de cada fila del XML que comunica el cliente y la aplicacion.
 *              Contiene metodos de formateos de Strings.
 * Copyright:    Copyright (c) 2002
 * Company: JAKARTA SRL:
 */

public class HashtableDS extends HashMap implements MapDS, IMapRequest {
	
	public HashtableDS() {
	}
	
	public Tabla getTabla(String aName) throws ExceptionValidacion{
		return (Tabla) this.get(aName);
	}
	
	/**
	 *
	 * @param aVal El valor a buscar en la coleccion
	 * @return
	 * @throws ParameterNotFound Si no encuentra el parametro requerido
	 */
	
	public Object getObject(String aName) throws ExceptionValidacion{
		Object valor = this.get(aName);
		if(valor == null)
			throw new ExceptionValidacion("Parametro no encontrado: " + aName);
		
		return valor;
	}
	
	/**
	 *
	 * @param aVal El valor a buscar en la coleccion
	 * @return
	 * @throws ParameterNotFound Si no encuentra el parametro requerido
	 */
	public String getString(String aName) throws ExceptionValidacion{
		String res = (String) this.getObject(aName);
//		if (res.equals("")) res = "  ";
		return res;
	}
	
	/**
	 * Crea un integer con el valor encontrado
	 * @param aVal El valor a buscar en la coleccion
	 * @return
	 * @throws ParameterNotFound Si no encuentra el parametro requerido
	 * @throws ExceptionValidacion Si no tiene formato de entero
	 */
	public Integer getInteger(String aName) throws ExceptionValidacion{
		String res = this.getString(aName);
		
		try{
			return new Integer(res);
		}
		catch (ClassCastException e){
			throw new ExceptionValidacion(e,"Entero Erroneo: '" + res + "' en el parametro " + aName);
		}
		catch (NumberFormatException e){
			throw new ExceptionValidacion(e,"Entero Erroneo: '" + res + "' en el parametro " + aName);
		}
	}
	
	/**
	 * Crea un long con el valor encontrado
	 * @param aVal El valor a buscar en la coleccion
	 * @return
	 * @throws ParameterNotFound Si no encuentra el parametro requerido
	 * @throws ExceptionValidacion Si no tiene formato de long
	 */
	public Long getLong(String aName) throws ExceptionValidacion{
		String res = this.getString(aName);
		
		try{
			return new Long(res);
		}
		catch (ClassCastException e){
			throw new ExceptionValidacion(e,"Long Erroneo: '" + res + "' en el parametro " + aName);
		}
		catch (NumberFormatException e){
			throw new ExceptionValidacion(e,"Long Erroneo: '" + res + "' en el parametro " + aName);
		}
	}
	
	/**
	 * Crea un double con el valor encontrado
	 * @param aVal El valor a buscar en la coleccion
	 * @return
	 * @throws ParameterNotFound Si no encuentra el parametro requerido
	 * @throws ExceptionValidacion Si no tiene formato de double
	 */
	public Double getDouble(String aName) throws ExceptionValidacion{
		return new Double(this.getSimpleDouble(aName));
	}
	
	/**
	 * Crea un date con el valor encontrado
	 * @param aVal El valor a buscar en la coleccion
	 * @return El objeto formateado como Date
	 * @throws ParameterNotFound Si no encuentra el parametro requerido
	 * @throws ExceptionValidacion Si no tiene formato de date
	 */
	
	public Date getDate(String aName) throws ExceptionValidacion{
		String valor = (String) this.getObject(aName);
		return DateUtil.getDate(valor);
	}
	
	/**
	 * Crea un boolean con el valor encontrado
	 * @param aVal El valor a buscar en la coleccion
	 * @return
	 * @throws ParameterNotFound Si no encuentra el parametro requerido
	 */
	public Boolean getBoolean(String aVal) throws ExceptionValidacion{
		String value = this.getString(aVal);
		if(value.equalsIgnoreCase("on")) 
			return new Boolean(true);
		
		return Boolean.valueOf(this.getString(aVal));
	}
	
	/**
	 * DEVUELVE UN OBJETO PARA GRABAR, YA SEA NUEVO O EXISTENTE.
	 * @param aSes
	 * @param aCampo
	 * @param aNickName
	 * @return IPersistente
	 * @throws ExceptionDS
	 */
//	public IPersistente getObject(ISesion aSes, String aCampo, Class aClassName) throws ExceptionDS{
//		IObjectServer server = aSes.getObjectServer(aClassName);
//		
//		Integer oid = this.getInteger(aCampo);
//		return server.getObjectForSave(oid);
//	}
	
	public int getSimpleInteger(String aName) throws ExceptionValidacion{
		return this.getInteger(aName).intValue();
	}
	
	public long getSimpleLong (String aName)throws ExceptionValidacion{
		return this.getLong(aName).longValue();
	}
	
	public double  getSimpleDouble(String aName) throws ExceptionValidacion{
		String value = "";
		try{
			value = this.getString(aName);
			
			if(value.indexOf(",") != -1)
				value = value.replace(',', '.');
			
			return DecimalRounder.getBigDecimal(value).doubleValue();
		}
		catch (ClassCastException e){
			throw new ExceptionValidacion(e,"Numero Erroneo: '" + value + "' en el parametro " + aName);
		}
		catch (NumberFormatException e){
			throw new ExceptionValidacion(e,"Numero Erroneo: '" + value + "' en el parametro " + aName);
		}
	}
	
	public boolean getSimpleBoolean(String aVal) throws ExceptionValidacion{
		return this.getBoolean(aVal).booleanValue();
	}

	/* (non-Javadoc)
	 * @see com.jkt.util.MapDS#getCollectionOfTables()
	 */
	public List<Tabla> getCollectionOfTables() {
		final List<Tabla> tableList=new ArrayList<Tabla>();
		Collection values = super.values();

		CollectionUtils.forAllDo(values, new Closure() {
			
			public void execute(Object arg0) {
				if (arg0 instanceof Tabla) {
					tableList.add((Tabla)arg0);
				}
			}
		});
		return tableList;
	
	}

	public List<Campos> getCollectionOfCampos() {
		final List<Campos> tableList=new ArrayList<Campos>();
		Collection values = super.values();

		CollectionUtils.forAllDo(values, new Closure() {
			
			public void execute(Object arg0) {
				if (arg0 instanceof Campos) {
					tableList.add((Campos)arg0);
				}
			}
		});
		return tableList;
	}

	public Object agregarCampos(Object o) {
		// TODO Auto-generated method stub
		return null;
	}
}