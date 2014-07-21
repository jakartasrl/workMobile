package com.jkt.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletOutputStream;

import com.jkt.excepcion.ExceptionDS;
import com.jkt.framework.writers.IHeaderDataSet;
//import com.jkt.framework.request.ISesion;
/**
 * Title:        Framework de Desarrollo de Aplicaciones Java
 * Description:  Este proyecto intenta generar un FrameWork de desarrollo generico de aplicaciones JAVA
 * Copyright:    Copyright (c) 2001
 * Company:      JAKARTA SRL
 * @author
 * @version 1.0
 */

public class Tabla implements IMapRequest {

	private MapDS atributos = new HashtableDS();
	private MapDS tablas    = new HashtableDS();
	private List<Registro> registros  = new ArrayList<Registro>();
	private StringBuffer strDataSet = new StringBuffer();
	private IHeaderDataSet header;
	
	
	public Tabla() {}

	public Tabla(String aName) {
		atributos.put("nombre", aName);
	}

    public void setHeaderDataSet(IHeaderDataSet aHeader){
    	header = aHeader;
    }
	
	public void setNombre(String aName) {
		atributos.put("nombre", aName);
	}

	public void addRegistro(Registro aReg){
		registros.add(aReg);
	}

	public List<Registro> getRegitros(){
		return registros;
	}

	public java.util.Collection getTablas(){
		return tablas.values();
	}

	public void removeRow(Object aKey){
		if(aKey instanceof Registro)
			registros.remove(aKey);
		else tablas.remove(aKey);
	}

	public Registro addFila() {
		Registro reg = new Registro();
		registros.add(reg);

		return reg;
	}

	public Object put(Object key, Object value) {
		if(value instanceof Registro){
			registros.add((Registro)value);
			return null;
		}

		return tablas.put(key, value);
	}

	public void addAtribute(Object aKey, Object aValue){
		atributos.put(aKey, aValue);
	}

	public Object getAtribute(Object aKey){
		return atributos.get(aKey);
	}

	public void write(ServletOutputStream stream) throws IOException{
		stream.print("<TABLA nombre=\"" + this.getNombre() + "\"  >" + "\n");

		Iterator it   = registros.iterator();
		while(it.hasNext()){
			Registro next = (Registro) it.next();
			next.write(stream);
		}

		stream.print("</TABLA>" + "\n");

		registros.clear();
		registros = null;
	}

	
	public void writeDataSet() throws IOException{
		// completa la variable  strDataSet con lo que se manda al stream. 
		// Se debe completar primero con el HeaderDataset Y luego con los datos de la tabla.
		// Ver TDataSetMaker.
		
		strDataSet.append(header.toString());
		strDataSet.append("\n");
		
		boolean pra = true;
		Iterator it   = registros.iterator();
		while(it.hasNext()){
			Registro next = (Registro) it.next();
			next.writeDataSet(strDataSet, pra, header);
			pra = false;
		}
		
	}

	public String getNombre(){
		return (String) atributos.get("nombre");
	}

//	public List getListaObjetos(ISesion sesion, String aNombreCampo, Class aClase) throws ExceptionDS{
//		List lista = new ArrayList();
//
//		Iterator it = this.getRegitros().iterator();
//		while(it.hasNext()){
//			Registro reg = (Registro) it.next();
//			lista.add( reg.getObject(sesion, aNombreCampo, aClase));
//		}
//
//		return lista;
//	}

	public Tabla getTabla(String aName) throws ExceptionDS{
		Tabla result = (Tabla) tablas.get(aName);

		if(result == null)
			throw new ExceptionDS("No se encontro la tabla: " + aName);

		return result;
	}

	public int getLongitudStrDataSet() {
		return strDataSet.length();
	}
	
	public StringBuffer getStrDataSet() {
		return strDataSet;
	}
}