package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ObjectView;

/**
 * {@link ObjectView} for entity {@link LaboratorioOV}
 * 
 * @author erubino
 *
 */
public class LaboratorioOV extends ObjectView {

	private String codigo;
	private String descripcion;
	private List laboratorios=new ArrayList();
	private Boolean activo=Boolean.FALSE;
	
	public Boolean getActivo() {
		return activo;
	}

	public void setActivo(Boolean activo) {
		this.activo = activo;
	}

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
	
	public List getLaboratorios() {
		return laboratorios;
	}

	public void setLaboratorios(List laboratorios) {
		this.laboratorios = laboratorios;
	}

}
