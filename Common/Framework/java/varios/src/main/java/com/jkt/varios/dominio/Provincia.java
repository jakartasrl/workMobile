package com.jkt.varios.dominio;

import com.jkt.dominio.Descriptible;

/**
 * Representa a la entidad provincia.
 * @see Pais
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Provincia extends Descriptible {

	private static final long serialVersionUID = -6001953931131171130L;
	private Pais pais;

	public Pais getPais() {
		return pais;
	}

	public void setPais(Pais pais) {
		this.pais = pais;
	}

}
