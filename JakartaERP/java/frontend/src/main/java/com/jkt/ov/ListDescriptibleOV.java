package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ListOV;

/**
 * Helperclass for DescriptibleOV
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ListDescriptibleOV extends ListOV {

	private List<DescriptibleOV> list=new ArrayList<DescriptibleOV>();
	
	@Override
	public List getList() {
		return list;
	}

}
