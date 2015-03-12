package com.jkt.ov;

import com.jkt.view.ObjectView;

/**
 * 
 * 
 * @author erubino
 *
 */
public class LaboratorioOV extends ObjectView {

	private String codigo="codigot", descripcion="river";

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

}
