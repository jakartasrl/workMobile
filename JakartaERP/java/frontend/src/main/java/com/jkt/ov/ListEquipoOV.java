package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ListOV;

public class ListEquipoOV extends ListOV {
	
	private List<EquipoOV> list=new ArrayList<EquipoOV>();

	@Override
	public List getList() {
		return list;
	}
	
}
