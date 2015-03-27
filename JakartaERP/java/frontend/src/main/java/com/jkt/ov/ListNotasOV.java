package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ListOV;

/**
 * {@link ListOV} para las {@link NotaOV}s
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ListNotasOV extends ListOV {

	private List<NotaOV> list=new ArrayList<NotaOV>();
	
	@Override
	public List getList() {
		return list;
	}

}
