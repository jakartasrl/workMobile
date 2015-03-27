package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ListOV;

public class ListCaracteristicaProductoOV extends ListOV {

	private List<CaracteristicaProductoOV> list=new ArrayList<CaracteristicaProductoOV>();
	
	@Override
	public List getList() {
		return list;
	}

}
