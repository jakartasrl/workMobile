package com.jkt.framework.writers;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletOutputStream;

import com.jkt.excepcion.ExceptionDS;
import com.jkt.util.Tabla;

public class XMLTableMaker extends AbsWriter{
	
	private String identificadorTabla;
	private Tabla tabla;
	
	
	
//	TODO no se q hace esto, ni voy a mriarlo por ahora
//	public XMLTableMaker(String aStr, IOperation aOper){
//		if (aOper.isMultiDatasetWriter()){
//			IHeaderDataSet header = aOper.getHeaderDataSet(aStr);
//			this.addTabla(aStr, header);	
//		}
//		else{
//			this.addTabla(aStr);
//		}
//		aOper.addWriter(this);
//	}

	public XMLTableMaker(String descriptor, ServletOutputStream stream) {
		this.identificadorTabla=descriptor;
		this.setStream(stream);
		this.addTabla(descriptor);
	}

	public String getIdentificadorTabla() {
		return identificadorTabla;
	}

	public void setIdentificadorTabla(String identificadorTabla) {
		this.identificadorTabla = identificadorTabla;
	}

	public Tabla getTabla(String aKey){
		return (Tabla) tablas.get(aKey);
	}
	
	public void addTabla(Object aNombre){
		tabla = this.getTabla(aNombre.toString());
		if(tabla == null){
			tabla = new Tabla(aNombre.toString());
			tablas.put(aNombre, tabla);
		}
	}
	
	public void addTabla(Tabla aTabla){
		tabla = aTabla;
		tablas.put(tabla.getNombre(), tabla);
	}

	
	// metodo de DS se cambia luego
	public void addTabla(Object aNombre, IHeaderDataSet aHeader){
		tabla = this.getTabla(aNombre.toString());
		if(tabla == null){
			tabla = new Tabla(aNombre.toString());
			tabla.setHeaderDataSet(aHeader);
			tablas.put(aNombre, tabla);
		}
	}
	

	
	public void addFila(){
		registro = tabla.addFila();
	}
	
	public void removeFila(){
		tabla.removeRow(registro);
		registro = null;
	}
	
	public void addTablaEnFila(String aName) {
		tabla = new Tabla(aName);
		registro.put(aName, tabla);
	}
	
	public void write() throws ExceptionDS{
		try{
			Iterator it = tablas.values().iterator();
			while(it.hasNext()){
				Tabla next = (Tabla) it.next();
				next.write(stream);
			}
			tablas.clear();
		}
		catch(IOException e){
			throw new ExceptionDS(e, e.toString());
		}
		
		tabla    = null;
		registro = null;
	}   
}