package com.jkt.util;

import java.math.BigDecimal;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2003
 * Company:
 * @author
 * @version 1.0
 */

public class DecimalRounder {
	
	private static final int CANTIDAD_DIGITOS = 8;
	private static final int REDONDEO         = BigDecimal.ROUND_HALF_EVEN;
   
   public DecimalRounder() {
   }
   
   public static BigDecimal restar(double double1, double double2){
   	return restar(getBigDecimal(double1), getBigDecimal(double2));
   }

   public static BigDecimal restar(BigDecimal big1, BigDecimal big2){
   	return big1.subtract(big2);
   }

   public static BigDecimal sumar(double double1, double double2){
   	return sumar(getBigDecimal(double1), getBigDecimal(double2));
   }
   
   public static BigDecimal sumar(BigDecimal big1, BigDecimal big2){
   	return big1.add(big2);
   }
   
   public static BigDecimal dividir(BigDecimal numerador, BigDecimal divisor, int cantDigits){
   	return numerador.divide(divisor, cantDigits, REDONDEO);
   }

   public static BigDecimal dividir(double numerador, double divisor, int cantDigits){
   	return dividir(getBigDecimal(numerador), getBigDecimal(divisor), cantDigits);
   }
   
   public static BigDecimal multiplicar(BigDecimal big1, BigDecimal big2){
   	return big1.multiply(big2);
   }
   
   public static BigDecimal multiplicar(BigDecimal big1, BigDecimal big2, int cantDigits){
      return big1.multiply(big2).setScale(cantDigits, REDONDEO);
   }
   
   public static BigDecimal multiplicar(double double1, double double2){
   	return multiplicar(getBigDecimal(double1), getBigDecimal(double2));
   }

   public static BigDecimal multiplicar(double double1, double double2, int cantDigits){
   	return multiplicar(getBigDecimal(double1), getBigDecimal(double2)).setScale(cantDigits, REDONDEO);
   }
   
   public static BigDecimal getBigDecimal(double aDouble, int cantDigits){
   	return new BigDecimal("" + aDouble).setScale(cantDigits, REDONDEO);
   }

   public static BigDecimal getBigDecimal(String aNum){
   	return new BigDecimal(aNum).setScale(CANTIDAD_DIGITOS, REDONDEO);
   }
   
   public static BigDecimal getBigDecimal(double aDouble){
   	return new BigDecimal("" + aDouble).setScale(CANTIDAD_DIGITOS, REDONDEO);
   }
      
   public static double redondear(BigDecimal aValue, int cantDigits){
      return new BigDecimal("" + aValue.doubleValue()).setScale(cantDigits, REDONDEO).doubleValue();
   }
      
   public static double redondear(double aValue, int cantDigits){
      return new BigDecimal("" + aValue).setScale(cantDigits, REDONDEO).doubleValue();
   }
      
   public static double[] dividirEn(double importe, int cantCuotas){
      if(cantCuotas == 0) cantCuotas = 1;
      
      double[] cuotas = new double[cantCuotas];
      
      double parcial = redondear( (importe / cantCuotas) , 2);
      
      for(int i = 0; i< (cantCuotas - 1); i++){
         cuotas[i] = parcial;
         
         importe = redondear( (importe - parcial), 2);
      }
      
      cuotas[cantCuotas - 1] = redondear(importe, 2);
      
      return cuotas;
   }
   
   public static double[] dividirEn(double importe, int cantCuotas, int cantDecimales){
      if(cantCuotas == 0) cantCuotas = 1;
      
      double[] cuotas = new double[cantCuotas];
      
      double parcial = redondear( (importe / cantCuotas), cantDecimales);
      
      for(int i = 0; i< (cantCuotas - 1); i++){
         cuotas[i] = parcial;
         
         importe = redondear( (importe - parcial), cantDecimales);
      }
      
      cuotas[cantCuotas - 1] = redondear(importe, cantDecimales);
      
      return cuotas;
   }

   public static double[] dividirEn(double importe, double[] porcentajes){
      double[] cuotas = new double[porcentajes.length];
      
      double resto = importe;
      
      for(int i = 0; i< (porcentajes.length - 1); i++){
         double aux = redondear( (importe * porcentajes[i] / 100), 2);
         
         resto = redondear( resto - aux, 2);
         
         cuotas[i] = redondear(aux, 2);
      }
      
      cuotas[porcentajes.length - 1] = redondear(resto, 2);
      
      return cuotas;
   }
}