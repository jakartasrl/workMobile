package com.jkt.framework.writers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;

import com.jkt.util.Registro;
import com.jkt.util.Tabla;


public abstract class AbsWriter implements IWriter {
   
   private static String replyHeader = "<?xml version=\"1.0\" encoding=\"ISO-8859-1\" standalone=\"yes\"?>\n";
   
   protected ServletOutputStream stream;
   protected SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
   protected boolean huboErrores = false;
   protected Registro registro;
   
   protected Map tablas = new HashMap();
   protected List writers = new ArrayList();
   
   
   public void setStream(ServletOutputStream aStream) {
      stream = aStream;
   }
  

   public void addTabla(Object aNombre, IHeaderDataSet aHeader){
	   // Vacio para que lo reescriba el que lo necesite
   }
   
   public ServletOutputStream getStream() {
      return stream;
   }
   
   public void writeEndTag() throws IOException {
      stream.println("</RESPONSE>");
      stream.flush();
      stream.close();
   }
   
   public void writeStartTag()throws IOException{
      stream.println(replyHeader);
      stream.println("<RESPONSE STATUS=\"" + IWriter.OK + "\" MENSAJE=\"" + "\"" + " >");
   }
   
   public void writeStartTagException(String msg)throws IOException{
      huboErrores = true;
      
      stream.println(replyHeader);
      stream.println("<RESPONSE STATUS=\"" + IWriter.ERROR  + "\" MENSAJE=\"" + msg + "\"" + " >");
   }
   
   public void writeStartTagWarning(String msg)throws IOException{
      huboErrores = true;
      
      stream.println(replyHeader);
      stream.println("<RESPONSE STATUS=\"" + IWriter.WARNING + "\" MENSAJE=\"" + msg + "\"" + " >");
   }
   
   public void putTablas(HttpServletRequest req){
      Iterator it = tablas.entrySet().iterator();
      while(it.hasNext()){
         Map.Entry next = (Map.Entry) it.next();
         req.setAttribute(next.getKey().toString(), ((Tabla) next.getValue()).getRegitros());
      }
   }
   
   public void addColumna(String aColName, String aStr){
   	if (aStr == null)
   		  registro.put(aColName, "");
   	
   	//SE REEMPLAZAN LAS " CON &quot;
   	else registro.put(aColName, aStr.replaceAll("\"", "&quot;"));
   }
   
   public void addColumna(String aColName, double aDou){
      registro.put(aColName, "" + aDou);
   }
   
   public void addColumna(String aColName, int aInt){
      registro.put(aColName, "" + aInt);
   }
   
   public void addColumna(String aColName, boolean aBol){
      registro.put(aColName, "" + aBol);
   }
   
   public void addColumna(String aColName, Object aObj){
	  if ((aObj instanceof String) && (aObj != null)){
		  String str = (String) aObj;
		  registro.put(aColName, str.replaceAll("\"", "&quot;")); 
	  }
	  else {
		  registro.put(aColName, aObj);
	  }
   }
   
   public void addColumna(String aColName, Date aObj){
      registro.put(aColName, sdf.format(aObj));
   }

   public void addWriter(IWriter aWriter){
	   writers.add(aWriter);
   }
   
   public List getWriters(){
	   return writers;
   }
   
   public void writeAll(){
	      this.write();

	      Iterator it = writers.iterator();
	      while(it.hasNext()){
	         IWriter next = (IWriter) it.next();
	         next.setStream(this.getStream());
	         next.write();
	      }

   }
   
   public Map  getTablas(){
	   return tablas;
   }
}