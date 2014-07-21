package com.jkt.dominio;

import java.util.Calendar;

import org.apache.commons.codec.binary.Base64;
import org.joda.time.LocalDateTime;

/**
 * Clase que contiene informacion de passwords anteriores y proximas a vencer.
 * La ultima instancia de esta clase persistente es la password actual del
 * usuario
 * 
 * @see Usuario
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class HistorialPassword extends PersistentEntity {

	public HistorialPassword() {
		//For not to broke persistence when data is null
//		this.fechaVencimiento=LocalDateTime.now().plusDays(60);
//		Calendar.getInstance();
	}
	
	private byte[] password;
	private LocalDateTime fechaVencimiento;

	public LocalDateTime getFechaVencimiento() {
		return fechaVencimiento;
	}

	public void setFechaVencimiento(LocalDateTime fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}

	public void setPassword(byte[] password) {
		this.password = Base64.encodeBase64(password);
	}
	
	/**
	 * Compara una password dada contra la de esta entidad.
	 * 
	 * @param passwordAComparar
	 * @return
	 */
	public boolean compararPasswords(String passwordAComparar){
		byte[] encodeBase64 = Base64.encodeBase64(passwordAComparar.getBytes());
		return this.password.equals(encodeBase64);
	}

	public byte[] getPassword() {
		return password;
	}

	
	/*
	public static void main(String  [] args){
//		HistorialPassword historialPassword = new HistorialPassword();
//		historialPassword.set
		
		byte[] encoded = Base64.encodeBase64("leonelSuarez".getBytes());
		System.out.println(encoded);
		
		String string = new String(encoded);
		System.out.println(string);
		
		   //decoding byte array into base64
        byte[] decoded = Base64.decodeBase64(encoded);      
        System.out.println("Base 64 Decoded  String : " + new String(decoded));
        System.out.println("Base 64 Decoded  String2 : " + Base64.decodeBase64(string));


		
	}*/
}
