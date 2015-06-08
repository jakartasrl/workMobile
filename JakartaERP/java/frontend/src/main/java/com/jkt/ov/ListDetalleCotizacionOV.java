package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.view.ListOV;

public class ListDetalleCotizacionOV extends ListOV {

	private List<DetalleCotizacionOV> list =  new ArrayList<DetalleCotizacionOV>();
	
	@Override
	public List getList() {
		return list;
	}

}

