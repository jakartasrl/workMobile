package com.jkt.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import com.jkt.excepcion.ExceptionValidacion;

public class DateUtil {
	
   public static Date fechaDiaDeHoy() {
      Calendar cal = Calendar.getInstance();
      cal.set(Calendar.HOUR, 0);
      cal.set(Calendar.MINUTE, 0);
      cal.set(Calendar.SECOND, 0);
      cal.set(Calendar.MILLISECOND, 0);
      cal.set(Calendar.AM_PM, Calendar.AM);

      return cal.getTime();
   }

   /**
    * @param aFecDesde
    * @param aFecHasta
    * @return Cantidad de Dias.
    */
   public static int calcularDiferencia(Date aFecDesde, Date aFecHasta, boolean masUno) {
      // Ej: a = 01/09/2006, b = 30/09/2006 -> 30
      // Ej: a = 01/09/2006, b = 01/09/2006 -> 1
      // Ej: a = 01/01/2000, b = 31/12/2000 -> 366 (Año Bisiesto)
      // Ej: a = 01/01/2001, b = 31/12/2001 -> 365 (Año Normal)

      int tempDifference = 0;
      int difference = 0;
      Calendar earlier = Calendar.getInstance();
      Calendar later = Calendar.getInstance();

      if (aFecDesde.compareTo(aFecHasta) < 0) {
         earlier.setTime(aFecDesde);
         later.setTime(aFecHasta);
      } else {
         earlier.setTime(aFecHasta);
         later.setTime(aFecDesde);
      }

      while (earlier.get(Calendar.YEAR) != later.get(Calendar.YEAR)) {
         tempDifference = 365 * (later.get(Calendar.YEAR) - earlier.get(Calendar.YEAR));
         difference += tempDifference;

         earlier.add(Calendar.DAY_OF_YEAR, tempDifference);
      }

      if (earlier.get(Calendar.DAY_OF_YEAR) != later.get(Calendar.DAY_OF_YEAR)) {
         tempDifference = later.get(Calendar.DAY_OF_YEAR) - earlier.get(Calendar.DAY_OF_YEAR);
         difference += tempDifference;

         earlier.add(Calendar.DAY_OF_YEAR, tempDifference);
      }

      if (masUno)
         return difference + 1;

      return difference;
   }

   public static int getDia(Date aFecha) {
      Calendar calendarDesde = GregorianCalendar.getInstance();
      calendarDesde.setTime(aFecha);
      return calendarDesde.get(Calendar.DAY_OF_MONTH);
   }

   public static int getMes(Date aFecha) {
      Calendar calendarDesde = GregorianCalendar.getInstance();
      calendarDesde.setTime(aFecha);
      return calendarDesde.get(Calendar.MONTH) + 1;
   }

   public static int getAnio(Date aFecha) {
      Calendar calendarDesde = GregorianCalendar.getInstance();
      calendarDesde.setTime(aFecha);
      return calendarDesde.get(Calendar.YEAR);
   }

   public static int getSemana(Date aFecha) {
      int dia = DateUtil.getDia(aFecha);
      if (dia <= 7)
         return 1;
      if (dia > 7 && dia <= 14)
         return 2;
      if (dia > 14 && dia <= 21)
         return 3;
      return 4;
   }

   public static int getQuincena(Date aFecha) {
      int dia = DateUtil.getDia(aFecha);
      return dia <= 15 ? 1 : 2;
   }

   public static Date getFecha(int anio, int mes, int dia) {
      Calendar cal = GregorianCalendar.getInstance();
      cal.set(Calendar.YEAR, anio);
      cal.set(Calendar.MONTH, mes - 1);
      cal.set(Calendar.DATE, dia);
      return cal.getTime();
   }

   public static Date getPrimerDia(Date aFecha) {
      Calendar aux = GregorianCalendar.getInstance();
      aux.setTime(aFecha);
      aux.set(Calendar.DATE, 1);
      return aux.getTime();
   }

   public static Date getUltimoDia(Date aFecha) {
      Calendar aux = GregorianCalendar.getInstance();
      aux.setTime(aFecha);
      aux.add(Calendar.MONTH, 1);
      aux.set(Calendar.DATE, 1);
      aux.add(Calendar.DATE, -1);
      return aux.getTime();
   }

   public static Date getDate(String Obj) throws ExceptionValidacion {
      SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yy");

      try {
         return sdf.parse(Obj);
      } catch (java.text.ParseException e) {
         throw new ExceptionValidacion(e, "Fecha Erronea, debe ingresar una fecha con formato DD/MM/YY: " + Obj);
      }
   }

   public static String getHoraMinutoSegundoHoy(boolean segundo) {
      Calendar cal = Calendar.getInstance();
      return cal.get(Calendar.HOUR) + ":" + cal.get(Calendar.MINUTE) + (segundo ? ":" + cal.get(Calendar.SECOND) : "");
   }

   /**
    * @param aFecDesde
    * @param aFecHasta
    * @return Cantidad de Minutos.
    */
   public static int calcularDiferenciaMinutos(Date aFecDesde, Date aFecHasta) {
      Date fechaMayor = null;
      Date fechaMenor = null;

      if (aFecDesde.compareTo(aFecHasta) > 0) {
         fechaMayor = aFecDesde;
         fechaMenor = aFecHasta;
      } else {
         fechaMayor = aFecHasta;
         fechaMenor = aFecDesde;
      }

      long diferenciaMils = fechaMayor.getTime() - fechaMenor.getTime();

      return (int) diferenciaMils / 60000;
   }

   public static Date getFechaHora (Date aFecha, String aHora) {
      
      int hora = Integer.valueOf( aHora.substring(0, aHora.indexOf(":")) ).intValue();
      int minu = Integer.valueOf( aHora.substring(aHora.indexOf(":")+1) ).intValue();
      
      Calendar cal = GregorianCalendar.getInstance();
      cal.setTime(aFecha);
      cal.set(Calendar.HOUR_OF_DAY, hora);
      cal.set(Calendar.MINUTE,      minu);
      cal.set(Calendar.SECOND,      0);
      
      return cal.getTime();
   }

   public static long calcularDiferenciaDias(Date aFecDesde, Date aFecHasta, boolean masUno) {

      Calendar earlier = Calendar.getInstance();
      Calendar later   = Calendar.getInstance();

      earlier.setTime(aFecDesde);
      later.setTime(aFecHasta);

      long difms = earlier.getTimeInMillis() - later.getTimeInMillis();
      long difference = difms / (1000 * 60 * 60 * 24);
      
      return difference;
   }

   
   /**
    * @param aFecDesde
    * @param aFecHasta
    * @return Cantidad de Horas.
    */
   public static int calcularDiferenciaHoras(Date aFecDesde, Date aFecHasta) {
      int minutos = calcularDiferenciaMinutos(aFecDesde, aFecHasta);
      return (minutos / 60);
   }

   
   /**
    * @param aFecDesde
    * @param cantDias
    */
   
   public static Date getNuevaFechaIncDias(java.util.Date fecha, int cantDias) {
	   Calendar cal = GregorianCalendar.getInstance();
	   cal.setTime(fecha);
	   cal.add(Calendar.DATE,cantDias);
	   return cal.getTime();
   }

   
   /**
    * Devuelve la fecha correspondiente a la suma de una cantidad de Dias, Meses, Anios, Horas, Minutos o Segundos.
    * Valor positivo para incrementar o negativo para decrementar
    * Usar constantes de Calendar para el 3° parametro:
    *      Calendar.YEAR 
    *      Calendar.MONTH
    *      Calendar.DATE
    *      Calendar.HOUR
    *      Calendar.MINUTE
    *      Calendar.SECOND
    * 
    * Ejemplo: getSiguiente ( fechaHoy, -2, Calendar.YEAR ) 
    * * * si fechaHoy = 01/01/2006 => 01/11/2006
    * Ejemplo: getSiguiente ( fechaHoy, 15, Calendar.DATE ) 
    * * * si fechaHoy = 01/01/2006 => 16/11/2006
    * 
    * @param aFecha
    * @param aIncDec
    * @param aDiaMesAnio
    * @return Fecha Nueva.
    */
   public static Date getSiguiente(Date aFecha, int aIncDec, int aDiaMesAnioHoraMinSeg) {
      Calendar cal = Calendar.getInstance();
      cal.setTime(aFecha);
      cal.add(aDiaMesAnioHoraMinSeg, aIncDec); 
      return cal.getTime();
   }
   
   public static String formatear(Date aFecha, String aFormato) {
      SimpleDateFormat sdf = new SimpleDateFormat(aFormato);
      return (aFecha != null ? sdf.format(aFecha) : ""); 
   }
   
   public static boolean isDate(String Obj) throws ExceptionValidacion {
      SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yy");

      try {
         sdf.parse(Obj);
         return true;
      } catch (java.text.ParseException e) {
      	return false;
      }
   }
   
}