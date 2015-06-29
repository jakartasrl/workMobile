package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ListOV;

public class ListMenuOV extends ListOV {

	private List<MenuOV> list = new ArrayList<MenuOV>();
	
	@Override
	public List getList() {
		return list;
	}

}
