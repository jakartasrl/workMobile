package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ListOV;

public class ListRepresentantesOV extends ListOV {

	private List<RepresentanteOV> list=new ArrayList<RepresentanteOV>();
	
	@Override
	public List getList() {
		return list;
	}

}

