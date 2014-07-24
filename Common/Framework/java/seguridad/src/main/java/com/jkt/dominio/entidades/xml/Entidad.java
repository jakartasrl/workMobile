package com.jkt.dominio.entidades.xml;

import java.util.ArrayList;
import java.util.List;

/**
 * Entidad representa al tag ENTIDAD del archivo metaData.xml
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Entidad {
	private String nombre;
	private Operacion operacion;
	private List<Campo> campos = new ArrayList<Campo>();
	private List<Validador> validadores = new ArrayList<Validador>();

	public void agregarCampo(Campo c) {
		campos.add(c);
	}

	public void agregarValidador(Validador v) {
		validadores.add(v);
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Operacion getOperacion() {
		return operacion;
	}

	public void setOperacion(Operacion operacion) {
		this.operacion = operacion;
	}

	public List<Campo> getCampos() {
		return campos;
	}

	public void setCampos(List<Campo> campos) {
		this.campos = campos;
	}

	public List<Validador> getValidadores() {
		return validadores;
	}

	public void setValidadores(List<Validador> validadores) {
		this.validadores = validadores;
	}

}
