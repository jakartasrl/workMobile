package com.jkt.framework.writers;

import java.io.IOException;
import java.util.Date;

import com.jkt.excepcion.ExceptionDS;


public class TDataSetMaker extends AbsWriter{
	
	public void addTabla(Object aNombre) throws ExceptionDS{
		try{
			if (aNombre instanceof IHeaderDataSet ){
				//VA A SER UN HEADERDATASET
				IHeaderDataSet header = (IHeaderDataSet) aNombre;
				stream.print(header.toString());
				stream.print(header.getTituloCampos());
			}
			else{
				stream.print(aNombre.toString());

			}
		}
		catch(Exception e){
			throw new ExceptionDS(e, e.toString());
		}
	}

	public void addColumna(String aColName, Date aObj){
		try {
			stream.print("\"" + sdf.format(aObj) + "\",");
		}
		catch (Exception ex) {}
	}
	
	public void addColumna(String aColName, String aStr){
		try {
			stream.print("\"" + aStr.replace('"', ' ') + "\",");
		}
		catch (Exception ex) {}
	}
	
	public void addColumna(String aColName, int aInt) {
		try {
			stream.print("\"" + aInt + "\",");
		}
		catch (IOException ex) {}
	}
	
	public void addColumna(String aColName, double aDou){
		try {
			stream.print("\"" + aDou + "\",");
		}
		catch (IOException ex) {}
	}
	
	public void addColumna(String aColName, boolean aBol){
		try {
			stream.print("\"" + aBol + "\",");
		}
		catch (IOException ex) {}
	}
	
	public void addColumna(String aColName, Object aObj){
		try {
			stream.print("\"" + aObj + "\",");
		}
		catch (IOException ex) {}
	}
	
	public void write() {
	}
	
	public void addFila() throws ExceptionDS{
		try{
			stream.println("");
		}
		catch(Exception e){
			throw new ExceptionDS(e, e.toString());
		}
	}
	
	//ESTE REESCRIBE PORQUE NO MANDA XML
	public void writeEndTag() throws IOException {
		if(huboErrores)
			stream.println("</RESPONSE>");
		
		stream.flush();
		stream.close();
	}
	
	//ESTE REESCRIBE PORQUE NO MANDA XML
	public void writeStartTag()throws IOException{}
}