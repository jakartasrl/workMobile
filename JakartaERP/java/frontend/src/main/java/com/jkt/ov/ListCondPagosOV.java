package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;
import com.jkt.view.ListOV;

public class ListCondPagosOV extends ListOV {

	private List<CondPagoOV> list=new ArrayList<CondPagoOV>();
	
	@Override
	public List getList() {
		return list;
	}

}
