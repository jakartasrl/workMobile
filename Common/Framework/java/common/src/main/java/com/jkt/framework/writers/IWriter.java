package com.jkt.framework.writers;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;

/**
 * <p>Title: Framework de Desarrollo de Aplicaciones Java</p>
 * <p>Description: Este proyecto intenta generar un FrameWork de desarrollo generico de aplicaciones JAVA</p>
 * <p>Copyright: Copyright (c) 2001</p>
 * <p>Company: TecnoServ</p>
 */

public interface IWriter {
   public final String ERROR   = "ERROR";
   public final String OK      = "OK";
   public final String WARNING = "WARNING";
   
   public void addColumna(String aColName, int aInt);
   public void addColumna(String aColName, boolean aInt);
   public void addColumna(String aColName, double aDou);
   public void addColumna(String aColName, Object aObj);
   public void addColumna(String aColName, String aStr);
   public void addColumna(String aColName, Date aDate);
   
   public void addTabla(Object aTabla);
   public void addFila();
   public void putTablas(HttpServletRequest req);
   
   public void write();
   public void setStream(ServletOutputStream aStream);
   
   public ServletOutputStream getStream();
   
   public void writeEndTag()                      throws IOException;
   public void writeStartTag()                    throws IOException;
   
   public void writeStartTagException(String msg) throws IOException;   
   public void writeStartTagWarning(String msg)   throws IOException;
   public void addTabla(Object aNombre, IHeaderDataSet aHeader);
   public void addWriter(IWriter aWriter);
   public void writeAll();
   public Map  getTablas();
   public List getWriters();
   
   
}