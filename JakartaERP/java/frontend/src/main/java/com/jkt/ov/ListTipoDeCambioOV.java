package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ListOV;

public class ListTipoDeCambioOV extends ListOV {
	
private List<TipoDeCambioOV> list=new ArrayList<TipoDeCambioOV>();
	
	@Override
	public List getList() {
		return list;
	}

}
