package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ListOV;

/**
 * Entidad para retornar listas de {@link LaboratorioOV}
 * 
 * @author erubino
 *
 */
public class ListLaboratorioOV extends ListOV {

	private List<LaboratorioOV> list=new ArrayList<LaboratorioOV>();
	
	@Override
	public List getList() {
		return list;
	}

}
