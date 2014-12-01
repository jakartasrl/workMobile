package com.jkt.dominio;

/**
 * <p>Una plantilla es un template para ingresar un texto que describe el objetivo a cotizar.</p>
 * 
 * <p><b>Se necesitan cotizar XX productos MM de JJxII dimensiones que cumplan con UU requisitos</b></p>
 * <p>Eso sería un ejemplo de plantilla, donde al plasmar el contenido de la plantilla, el usuario del sistema modifica
 * directamente sobre el texto planchado.</p>
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Plantilla extends Descriptible {

	private String plantilla;

	public String getPlantilla() {
		return plantilla;
	}

	public void setPlantilla(String plantilla) {
		this.plantilla = plantilla;
	}
	
}
