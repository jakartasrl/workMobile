/**
 * @author Chorch
 *
 * Clase hecha por Chorch el dia 23/01/2006 
 * para el proyecto Framework
 */
package com.jkt.xmlreader;

public class XMLEntityCustomRest extends XMLEntity {
   
   protected int num;
   protected String mensaje;
   protected String metodo;
   protected String param;
   protected String paramValue;

   public void setNum(int num) {   
      this.num = num;
   }
   
   public int getNum() {   
      return num;
   }
   
   public void setMensaje(String mensaje) {   
      this.mensaje = mensaje;
   }
   
   public String getMensaje() {   
      return mensaje;
   }
   
   public String getMetodo() {   
      return metodo;
   }
   
   public void setMetodo(String metodo) {   
      this.metodo = metodo;
   }
   
   public String getParam() {   
      return param;
   }
   
   public void setParam(String param) {   
      this.param = param;
   }
   
   public String getParamValue() {   
      return paramValue;
   }
   
   public void setParamValue(String paramValue) {   
      this.paramValue = paramValue;
   }
}
