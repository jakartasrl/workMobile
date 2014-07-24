package com.jkt.framework.writers;

import java.io.IOException;

import com.jkt.excepcion.ExceptionDS;
import com.jkt.util.Registro;


public class XMLStreamMaker extends AbsWriter{
	
	private String tabla;
	
	public void cerrarTabla() throws IOException{
		stream.println("</TABLA>");
	}

	public void addTabla(Object aNombre) throws ExceptionDS{
		try{
			if(registro != null){
				registro.write(stream);
				registro = null;
				stream.println("</TABLA>" + "\n");
			}
			
			tabla = aNombre.toString();
			stream.println("<TABLA nombre=\"" + tabla + "\"  >");
		}
		catch(Exception e){
			throw new ExceptionDS(e, e.toString());
		}
	}
	
	public void addFila() throws ExceptionDS{
		try{
			if(registro != null)
				registro.write(stream);
		}
		catch(Exception e){
			throw new ExceptionDS(e, e.toString());
		}
		
		registro = null;
		registro = new Registro();
	}
		
	public void write() throws ExceptionDS{
		try{
			if(registro != null)
				registro.write(stream);
			
			//PARA QUE IMPRIMA SI NO CARGUE NADA
			if(tabla != null)
				stream.println("</TABLA>");
		}
		catch(IOException e){
			throw new ExceptionDS(e, e.toString());
		}
		
		tabla    = null;
		registro = null;
	}
}