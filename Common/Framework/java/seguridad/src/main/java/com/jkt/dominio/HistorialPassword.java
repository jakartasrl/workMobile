package com.jkt.dominio;

import java.util.Arrays;
import java.util.Calendar;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.digest.DigestUtils;
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

	public byte[] getPassword() {
		return password;
	}

	public void setPassword(byte[] password) {
		this.password = password;
	}

	public boolean compararPasswords(String passwordAComparar) {
		byte[] passwordActual = this.getPassword();//Esta en md5
		byte[] passwordRecibida = DigestUtils.md5(passwordAComparar.getBytes());
		return Arrays.equals(passwordActual, passwordRecibida);
	}

	/**
	 * Compara una password dada contra la de esta entidad.
	 * 
	 * @param passwordAComparar
	 * @return
	 */
//	public boolean compararPasswords(String passwordAComparar){
//		return this.password.equals(DigestUtils.md5(passwordAComparar));
//		byte[] decoded = Base64.decodeBase64(this.password);
//		byte[] encodeBase64 = Base64.encodeBase64(passwordAComparar.getBytes());
//		return decoded.equals(passwordAComparar.getBytes());
//	}

	
	
}
