package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ListOV;

/**
 * Entidad para representar listas de sucursales.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ListSucursalesOV extends ListOV {

	private List<SucursalOV> list=new ArrayList<SucursalOV>();
	
	@Override
	public List getList() {
		return list;
	}

}
