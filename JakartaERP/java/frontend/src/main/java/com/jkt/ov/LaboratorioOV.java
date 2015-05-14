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
public class LaboratorioOV extends DescriptibleOV {

	public LaboratorioOV() {
		this.setActivo(Boolean.TRUE);
		this.setCodigo("");//=StringUtils.EMPTY;
		this.setDescripcion("");//=StringUtils.EMPTY;
	}
	
	private List laboratorios=new ArrayList();
	
	
	public List getLaboratorios() {
		return laboratorios;
	}

	public void setLaboratorios(List laboratorios) {
		this.laboratorios = laboratorios;
	}

}
