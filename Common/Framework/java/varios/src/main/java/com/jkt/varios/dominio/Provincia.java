package com.jkt.varios.dominio;

import com.jkt.dominio.Descriptible;

/**
 * Representa a la entidad provincia.
 * @see Pais
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Provincia extends Descriptible {

	private Pais pais;

	public Pais getPais() {
		return pais;
	}

	public void setPais(Pais pais) {
		this.pais = pais;
	}

}
