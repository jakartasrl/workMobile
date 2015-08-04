package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;
import com.jkt.view.ListOV;

public class ListVendedoresOV extends ListOV {

	private List<VendedorOV> list=new ArrayList<VendedorOV>();
	
	@Override
	public List getList() {
		return list;
	}

}