package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ListOV;

public class ListProtocoloEstadisticaOV extends ListOV {
	
private List<ProtocoloEstadisticaOV> list=new ArrayList<ProtocoloEstadisticaOV>();
	
	@Override
	public List getList() {
		return list;
	}

}
