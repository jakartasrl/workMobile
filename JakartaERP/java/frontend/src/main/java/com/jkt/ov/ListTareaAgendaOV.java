package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ListOV;

public class ListTareaAgendaOV extends ListOV {

	private List<TareaAgendaOV> list=new ArrayList<TareaAgendaOV>();
	
	@Override
	public List getList() {
		return list;
	}

}
