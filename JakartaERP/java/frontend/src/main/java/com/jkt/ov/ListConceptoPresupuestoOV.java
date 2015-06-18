package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ListOV;

public class ListConceptoPresupuestoOV extends ListOV {

	private List<ConceptoPresupuestoOV> list = new ArrayList<ConceptoPresupuestoOV>();
	
	@Override
	public List getList() {
		return list;
	}

}
