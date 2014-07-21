/**
 * @author Chorch
 *
 * Clase hecha por Chorch el dia 30/01/2006 
 * para el proyecto Framework
 */
package com.jkt.xmlreader;

public class XMLEntityValidador extends XMLEntity {
   protected boolean preSave;
   
   public boolean isPreSave() {
      return preSave;
   }   
   public void setPreSave(boolean preSave) {   
      this.preSave = preSave;
   }   
}
