package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import lombok.EqualsAndHashCode;

import com.jkt.view.ObjectView;

/**
 * {@link ObjectView} for entity {@link LaboratorioOV}
 * 
 * @author erubino
 *
 */
@EqualsAndHashCode(callSuper=true, of={"codigo","descripcion"})
public class LaboratorioOV extends ObjectView {

	public LaboratorioOV() {
		this.setActivo(Boolean.TRUE);
		this.codigo=StringUtils.EMPTY;
		this.descripcion=StringUtils.EMPTY;
	}
	
	private String codigo;
	private String descripcion;
	private List laboratorios=new ArrayList();
	
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
