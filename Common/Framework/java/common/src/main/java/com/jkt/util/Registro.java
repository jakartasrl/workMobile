package com.jkt.util;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletOutputStream;

import com.jkt.excepcion.ExceptionValidacion;
import com.jkt.framework.writers.IHeaderDataSet;
//import com.jkt.framework.da.IObjectServer;
//import com.jkt.framework.patterns.clasificadores.IMetaClass;
//import com.jkt.framework.persistence.IPersistente;
//import com.jkt.framework.request.ISesion;
/**
 * Title:        Framework de Desarrollo de Aplicaciones Java
 * Description:  Este proyecto intenta generar un FrameWork de desarrollo generico de aplicaciones JAVA
 * Copyright:    Copyright (c) 2001
 * Company:      JAKARTA SRL
 * @author
 * @version 1.0
 */

public class Registro  implements IMapRequest{
	
	private MapDS campos = new HashtableDS();
	
	public void setCampos(MapDS campos) {
		this.campos = campos;
	}

	public Registro() {
	}
		
	public String getString(String aCampo) throws ExceptionValidacion{
		return campos.getString(aCampo);
	}
	
	public Double getDouble(String aCampo) throws ExceptionValidacion{
		return campos.getDouble(aCampo);
	}
	
	public double getSimpleDouble(String aCampo) throws ExceptionValidacion{
		return campos.getSimpleDouble(aCampo);
	}

	public boolean getSimpleBoolean(String aCampo) throws ExceptionValidacion{
		return campos.getSimpleBoolean(aCampo);
	}

	public Integer getInteger(String aCampo) throws ExceptionValidacion{
		return campos.getInteger(aCampo);
	}
	
	public int getSimpleInteger(String aCampo) throws ExceptionValidacion{
		return campos.getSimpleInteger(aCampo);
	}

	public Object getObject(String aCampo) throws ExceptionValidacion{
		return campos.getObject(aCampo);
	}
	
	public Boolean getBoolean(String aCampo) throws ExceptionValidacion{
		return campos.getBoolean(aCampo);
	}
	
	public java.util.Date getDate(String aCampo) throws ExceptionValidacion{
		return campos.getDate(aCampo);
	}
	
	public Tabla getTabla(String aCampo) throws ExceptionValidacion{
		return (Tabla) campos.getObject(aCampo);
	}
	
	public Object put(Object key, Object value) {
		return campos.put(key, value);
	}
	
	public boolean containsKey(String aKey){
		return campos.containsKey(aKey);
	}
	
//	/**
//	 * DEVUELVE UN OBJETO PARA GRABAR, YA SEA NUEVO O EXISTENTE.
//	 * @param aSes
//	 * @param aCampo
//	 * @param aNickName
//	 * @return IPersistente
//	 * @throws ExceptionDS
//	 * @deprecated REEMPLAZAR POR getnObject(ISesion, String, class) 
//	 */
//	public IPersistente getObject(ISesion aSes, String aCampo, String aNickName) throws ExceptionDS{
//		Integer oid = this.getInteger(aCampo);
//		
//		IObjectServer server = aSes.getObjectServer(aNickName);
//		return server.getObjectForSave(oid);
//	}
//	
//	/**
//	 * DEVUELVE UN OBJETO PARA GRABAR, YA SEA NUEVO O EXISTENTE.
//	 * @param aSes
//	 * @param aCampo
//	 * @param aNickName
//	 * @return IPersistente
//	 * @throws ExceptionDS
//	 */
//	public IPersistente getObject(ISesion aSes, String aCampo, Class aClassName) throws ExceptionDS{
//		IObjectServer server = aSes.getObjectServer(aClassName);
//		
//		Integer oid = this.getInteger(aCampo);
//		return server.getObjectForSave(oid);
//	}
		
   public void write(ServletOutputStream stream) throws IOException{
		stream.print("<FILA ");
		
		Iterator itKeys = campos.entrySet().iterator();
		while(itKeys.hasNext()){
			Map.Entry next = (Map.Entry) itKeys.next();
			stream.print(next.getKey() + "=\"" + next.getValue() + "\" ");
			next = null;
		}
		stream.print("/>\n");
		
		campos.clear();
		campos = null;
	}

   public void writeDataSet(StringBuffer strDataSet, boolean pra, IHeaderDataSet aHeader) throws IOException{
	    
		if (pra){
			StringBuffer titCampos = new StringBuffer();
			Iterator itKeys = campos.entrySet().iterator();
			while(itKeys.hasNext()){
				Map.Entry next = (Map.Entry) itKeys.next();
				// Los tipos y longitudes se ponen fijo solo para probar
				String campo = (String) next.getKey();
	
				titCampos.append("\""+campo+"\""+",");
			}
			strDataSet.append(titCampos.toString() + "\n");

		}
		
		strDataSet.append("");
		
		
		
		Iterator itKeys = campos.entrySet().iterator();
		while(itKeys.hasNext()){
			Map.Entry next = (Map.Entry) itKeys.next();
			// Si aparece un PIPE Cancela el ejecutable
			// Se manda el campo segun la definicion del mismo
			// esto es para que si en delphi esta definido como integer y se manda como double, no cancele
			String aName = (String ) next.getKey();
			String tipo = aHeader.getTipoCampo(aName);
			if (tipo.equalsIgnoreCase(IHeaderDataSet.INTEGER)){
				String valueStr = (String) next.getValue();
				Double value = new Double(valueStr);
				strDataSet.append("\"" + value.intValue()+("\""  + ","));
			}
			else{
			   strDataSet.append("\"" + next.getValue()+("\""  + ","));
			}
			next = null;
		}
		strDataSet.append("\n");
		campos.clear();
		campos = null;
	}

	public MapDS getCampos(){
		return campos;
	}

	public boolean contains(Object aKey) {
		// TODO Auto-generated method stub
		return false;
	}

   /**
    * DEVUELVE UN VALOR DE CLASIFICADOR.
    * @param aSes
    * @param aCampo
    * @param aNickName
    * @return IPersistente
    * @throws ExceptionDS
    */
//   public IPersistente getObject(String aCampo, IMetaClass aIMetaClass) throws ExceptionDS{
//      Integer oid = this.getInteger(aCampo);
//      return aIMetaClass.getValor(oid);
//   }
      
}