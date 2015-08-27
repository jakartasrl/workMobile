package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ListOV;

public class ListDetalleCaracteristicaProductoListOV extends ListOV {

	private List<DetalleCaracteristicaProductoOV> list= new ArrayList<DetalleCaracteristicaProductoOV>();
	
	@Override
	public List getList() {
		return list;
	}

}
