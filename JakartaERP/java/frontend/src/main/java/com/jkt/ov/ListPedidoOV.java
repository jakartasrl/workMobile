package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import org.hsqldb.lib.ArrayListIdentity;

import com.jkt.view.ListOV;

public class ListPedidoOV extends ListOV {

	private List<PedidoOV> list=new ArrayList<PedidoOV>();
	
	@Override
	public List getList() {
		return list;
	}

}
