package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ListOV;

public class ListProtocoloOV extends ListOV {

	private List<ProtocoloOV> list = new ArrayList<ProtocoloOV>();;;;
	
	@Override
	public List getList() {
		return list;
	}

}
