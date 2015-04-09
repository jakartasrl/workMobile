package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ListOV;

public class ListValorEsperadoOV extends ListOV {

	List <ValorEsperadoOV> list = new ArrayList<ValorEsperadoOV>();
	
	@Override
	public List getList() {
		return list;
	}

}
