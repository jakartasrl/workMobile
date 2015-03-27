package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ListOV;

/**
 * {@link ListOV} para {@link ItemsOV}
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ListItemsOV extends ListOV {

	private List<ItemsOV> list=new ArrayList<ItemsOV>();
	
	@Override
	public List getList() {
		return list;
	}

}
