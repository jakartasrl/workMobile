package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ListOV;

public class ListMarcaOV extends ListOV {
	
	private List<ValoresTablaOV> list=new ArrayList<ValoresTablaOV>();
	
	@Override
	public List getList() {
		return list;
	}

}
