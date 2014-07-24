package com.jkt.xmlreader;

import java.lang.reflect.Method;

import com.jkt.excepcion.ExceptionDS;

/**
 * ESTA CLASE SE USA TANTO PARA CADA PARAMETRO DE UN SELECT EN LA DB, COMO PARA DEFINIR LOS CAMPOS DE UN TRAERGENERICO
 * @author Leonardo Lopez Larraquy
 *
 */

public class XMLCampo extends XMLEntity {
   // NO HACE FALTA 1 DE ESTOS POR INSTANCIA
   //ADEMAS HAY 1 INSTANCIA DE XMLEntity POR METODO EN 
   //CADA DB
   private static PropertySolver solver = new PropertySolver(); 
   
   private int search = 1;
   private Method cachedMethod;
   private String cast;
   
   public String getCampo(){
      return super.getName();
   }
   
   public void setCampo(String aCampo){
      super.setName(aCampo);
   }
   
   public int getSearch() {
      return search;
   }
   
   public void setSearch(int search) {
      this.search = search;
   }
   
   public String getOSName() {
      return value;
   }
   
   public void setOSName(String param) {
      value = param;
   }
   
   public Method getCachedMethod(Object aObj) throws ExceptionDS, NoSuchMethodException, SecurityException{
      if(cachedMethod == null)
         cachedMethod = solver.getMethod(value, aObj);
      
      return cachedMethod;
   }
   
   public Object getInvocationResult(Object aObj) throws ExceptionDS, NoSuchMethodException, SecurityException{
	   try{
		   Method mt = this.getCachedMethod(aObj);
		   if(mt != null)
			   return solver.invoke(mt, aObj);
	   }
	   catch(Exception e){}
      
      return solver.resolveMethodInvocation(value, aObj);
   }
   
	public String getCast(){
		return cast;
	}
	
	public void setCast(String aCast){
		this.cast = aCast;
	}
   
}