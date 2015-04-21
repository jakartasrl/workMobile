package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ListOV;

public class ListVariableOV extends ListOV {
	
	List<VariableOV> list = new ArrayList<VariableOV>();
	
	@Override
	public List getList() {
		return list;
	}

}
