package com.jkt.xmlreader;

import java.util.HashSet;
import java.util.Set;

/**
 * Representa al tag forms del archivo operaciones.xml
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Forms extends XMLEntity {

	private Set<String> formularios = new HashSet<String>();

	public Set<String> getFormularios() {
		return formularios;
	}

	public void setFormularios(Set<String> formularios) {
		this.formularios = formularios;
	}

	public void addFormulario(Form formulario) {
		this.formularios.add(formulario.getName());
	}

}
