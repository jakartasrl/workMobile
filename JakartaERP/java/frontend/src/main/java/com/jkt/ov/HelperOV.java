package com.jkt.ov;

import com.jkt.view.ObjectView;

/**
 * Entidad para pasarle parametros a la operacion.
 * <p>A la operacion le envio el OV, pero le llega un String al mapa</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class HelperOV extends ObjectView {

	public HelperOV() {}

	private String clase;
	private String oidEntidadMaestra;
	
	public String getOidEntidadMaestra() {
		return oidEntidadMaestra;
	}

	public void setOidEntidadMaestra(String oidEntidadMaestra) {
		this.oidEntidadMaestra = oidEntidadMaestra;
	}

	public String getClase() {
		return clase;
	}

	public void setClase(String clase) {
		this.clase = clase;
	}

	public HelperOV(String clase) {
		super();
		this.clase = clase;
	}

}
