package com.jkt.varios.dominio;

import com.jkt.dominio.Descriptible;

public class ComponenteValor extends Descriptible {

	private static final long serialVersionUID = 7388198401142500855L;

	private Componente componente;

	public Componente getComponente() {
		return componente;
	}

	public void setComponente(Componente componente) {
		this.componente = componente;
	}

}
