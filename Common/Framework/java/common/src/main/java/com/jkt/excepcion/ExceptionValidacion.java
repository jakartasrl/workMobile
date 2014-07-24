package com.jkt.excepcion;

/**
 * Title:        Framework de Desarrollo de Aplicaciones Java
 * Description:  Este proyecto intenta generar un FrameWork de desarrollo generico de aplicaciones JAVA
 * Copyright:    Copyright (c) 2001
 * Company:      JAKARTA SRL
 * @author
 * @version 1.0
 */

public class ExceptionValidacion extends ExceptionDS {
   
   public ExceptionValidacion(Exception e, String aMessage) {
      super(e, aMessage);
   }
   
   public ExceptionValidacion(String aMessage) {
      super(aMessage);
   }
}