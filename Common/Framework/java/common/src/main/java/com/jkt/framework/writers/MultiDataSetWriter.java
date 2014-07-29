package com.jkt.framework.writers;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.jkt.excepcion.ExceptionDS;
import com.jkt.util.Tabla;


public class MultiDataSetWriter extends AbsWriter {
    public static String HEADER_MULTI_TABLE = "MULTITABLE";

	public void addFila() {
		// TODO Auto-generated method stub

	}

	public void addTabla(Object tabla) {
		// TODO Auto-generated method stub

	}

	public void write() throws ExceptionDS{
	}	
	
	public void writeAll() throws ExceptionDS{
		try{	
			// Manda el header identificatorio 
			stream.print(HEADER_MULTI_TABLE);
			Map tablas = new HashMap();
			Iterator itW = writers.iterator();
			while (itW.hasNext()){
				IWriter wr = (IWriter) itW.next();
				tablas.putAll(wr.getTablas());
			}
			
			// Primero. Itero para armar el dataset en string
			Iterator it = tablas.values().iterator();
			int qDatasets = 0;
			while(it.hasNext()){
				Tabla next = (Tabla) it.next();
				next.writeDataSet();
				qDatasets +=1;
			}
			// Manda la cantidad de Datasets que va a enviar;
			DecimalFormat nf = new DecimalFormat();
			nf.applyPattern("00");
			stream.print(nf.format(qDatasets));
			
			// Segundo. Itero para Obtener la longitud del dataset
			// Si se cambia el patern, debe cambiarse en Delphi jktCMet002
			nf.applyPattern("0000000");
			Iterator it2 = tablas.values().iterator();
			while(it2.hasNext()){
				Tabla next = (Tabla) it2.next();
				stream.print(nf.format(next.getLongitudStrDataSet()));
			}

			// tercero. Itero para mandar el dataset
			Iterator it3 = tablas.values().iterator();
			while(it3.hasNext()){
				Tabla next = (Tabla) it3.next();
				stream.print(next.getStrDataSet().toString());			
			}


		}
		catch(IOException e){
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
