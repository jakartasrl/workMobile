package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ListOV;

/**
 * Implementación de ListObjectView
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ListDeterminacionOV extends ListOV {

	private List<DeterminacionOV> list=new ArrayList<DeterminacionOV>();
	
	@Override
	public List getList() {
		return list;
	}

}
