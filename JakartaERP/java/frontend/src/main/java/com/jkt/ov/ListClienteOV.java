package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import com.jkt.erp.varios.Cliente;
import com.jkt.view.ListOV;

/**
 * Entidad que retorna una lista de ClienteOV.
 * @see ClienteOV
 * @see Cliente
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ListClienteOV extends ListOV {

	private List<ClienteOV> list=new ArrayList<ClienteOV>();
	
	@Override
	public List getList() {
		return list;
	}

}
