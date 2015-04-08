package com.jkt.ov;

import com.jkt.view.ObjectView;

/**
 * Contenedor de OVS que sirve para enviar datos que pueden ser de utilidad para las operaciones que solo necesitan entradas primitivas.
 * <p>No voy a crear 50 OVS para diferentes operaciones que necesitan ids y campos simples.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ContainerOV extends ObjectView {

	private Long long1;
	private Long long2;
	private Long long3;
	private Long long4;
	private String string1;
	private String string2;
	private String string3;
	private String string4;

	public ContainerOV() {}
	
	public ContainerOV(String string) {
		this.string1=string;
	}

	public Long getLong1() {
		return long1;
	}

	public void setLong1(Long long1) {
		this.long1 = long1;
	}

	public Long getLong2() {
		return long2;
	}

	public void setLong2(Long long2) {
		this.long2 = long2;
	}

	public Long getLong3() {
		return long3;
	}

	public void setLong3(Long long3) {
		this.long3 = long3;
	}

	public Long getLong4() {
		return long4;
	}

	public void setLong4(Long long4) {
		this.long4 = long4;
	}

	public String getString1() {
		return string1;
	}

	public void setString1(String string1) {
		this.string1 = string1;
	}

	public String getString2() {
		return string2;
	}

	public void setString2(String string2) {
		this.string2 = string2;
	}

	public String getString3() {
		return string3;
	}

	public void setString3(String string3) {
		this.string3 = string3;
	}

	public String getString4() {
		return string4;
	}

	public void setString4(String string4) {
		this.string4 = string4;
	}

}
