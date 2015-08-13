package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ListOV;

public class ListaClienteOV extends ListOV {

	private List<ClienteOV> list = new ArrayList<ClienteOV>();
	
	@Override
	public List getList() {
		return list;
	}

}
