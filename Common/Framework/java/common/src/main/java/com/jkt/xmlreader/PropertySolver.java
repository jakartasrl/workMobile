package com.jkt.xmlreader;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.StringTokenizer;

import com.jkt.excepcion.ExceptionDS;

/**
 * Comentarios agregador por Leonel Suárez.
 * A falta de una buena documentación, se procede a explicar esta clase rapidamente.
 * 
 * Esta clase resuelve via reflection, y dado un objeto, un nombre de un metodo.
 * 
 * Puede definir metodos set, get, o complejos.
 * Q quiere decir complejos? que el patron de metodo solititado puede ser "descripcion.mensaje"
 * Esto significa que dado un objeto dado, al ejecutar el metodo {@link #resolveMethodInvocation("descripcion.mensaje", factura)}
 * Se pedira el objeto factura el metodo getDescripcion(), y al resultado de esta operacion se le ejecutar el metodo getMensaje().
 * 
 * 
 * @author Jakarta SRL
 */
public class PropertySolver {
	private static final String IS    = "is";
	private static final String GET   = "get";
	private static final String PUNTO = ".";
   
   private String armarMetodo(String aName){
      if(aName.startsWith(IS)) return aName;
      
      String priLetra = "" + aName.charAt(0);
      String metodo = GET + priLetra.toUpperCase() +  aName.substring(1, aName.length());
      
      return metodo;
   }
   
	 /**
	 * @param aName
	 * @param aPersistente
	 * @return
	 * @throws ExceptionDS
	 * @throws SecurityException 
	 * @throws NoSuchMethodException 
	 */
   public Object resolveMethodInvocation(String aName, Object aPersistente) throws ExceptionDS, NoSuchMethodException, SecurityException{
	   Object aObj = aPersistente;
	   Method mt = this.getMethod(aName, aObj);
      
	   if(mt != null)
		   return this.invoke(mt, aObj);
      
      StringTokenizer a = new StringTokenizer(aName, PUNTO);
      while(a.hasMoreTokens()){
         String parcial = (String) a.nextElement();
         
         try{
            mt = this.getMethod(parcial, aObj);
            
            aObj = this.invoke(mt, aObj);            
         }
         catch(NullPointerException e){
            return null;
         }
      }
      
      return aObj;
   }
   
   public Object invoke(Method mt, Object aObj) throws ExceptionDS{
      try{
         return mt.invoke(aObj, null);   
      }
      catch(InvocationTargetException e){
         if(e.getTargetException() instanceof ExceptionDS)
            throw (ExceptionDS) e.getTargetException();
         
         throw new ExceptionDS(e, "Error a llamar al siguiente metodo: " + mt.getName());
      }
      catch(IllegalAccessException e){
         throw new ExceptionDS(e, "Error de acceso al llamar al siguiente metodo: " + mt.getName());
      }
   }
   
   /**
    * DEVUELVE EL METODO DEL BEAN SEGUN EL NOMBRE DE LA PROPERTY
    * SI EL METODO A DEVOLVER ES DE OTRO OBJETO, ESTE METODO DEVUELVE NULL  
    * @param aName NOMBRE DEL METODO
    * @param aObj  OBJETO SOBRE EL CUAL SE QUIERE OBTENER EL METODO
    * @return
 * @throws SecurityException 
    * @throws NoSuchMethodException
    */
   
   public Method getMethod(String aName, Object aObj) throws ExceptionDS, NoSuchMethodException, SecurityException{
      int indice = aName.indexOf('.');
      if(indice != -1)
         return null;
      
//      try{
         return aObj.getClass().getMethod(armarMetodo(aName), null);
//      }
//      catch(NoSuchMethodException e){
//    	 System.out.println("Falta metodo: " + aObj.getClass().getName() + " " + aName );
//         throw new ExceptionDS(e.toString());
//      }
   }
}