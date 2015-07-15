package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ListOV;

public class ListPropiedadMatricialOV extends ListOV {

private List<PropiedadMatricialOV> list=new ArrayList<PropiedadMatricialOV>();
	
	@Override
	public List getList() {
		return list;
	}
	
}
