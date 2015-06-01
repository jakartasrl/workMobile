package com.jkt.ov;

import java.util.Date;

import lombok.Data;

import com.jkt.view.ObjectView;

/**
 * Contenedor de OVS que sirve para enviar datos que pueden ser de utilidad para las operaciones que solo necesitan entradas primitivas.
 * <p>No voy a crear 50 OVS para diferentes operaciones que necesitan ids y campos simples.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class ContainerOV extends ObjectView {

	private Long long1;
	private Long long2;
	private Long long3;
	private Long long4;
	private String string1;
	private String string2;
	private String string3;
	private String string4;
	
	private Date fecha1;
	private Date fecha2;
	
	public ContainerOV() {}
	
	public ContainerOV(String string) {
		this.string1=string;
	}

}
