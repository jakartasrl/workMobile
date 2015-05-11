package com.jkt.ov.tree;

import java.util.ArrayList;

import org.zkoss.zul.DefaultTreeNode;

import com.jkt.ov.TituloModeloCotizadorOV;

public class NodoTitulos extends DefaultTreeNode<TituloModeloCotizadorOV>{
	
	public NodoTitulos(TituloModeloCotizadorOV data, boolean conHijos) {
		super(data, new ArrayList());
	}
	
	public NodoTitulos(TituloModeloCotizadorOV data) {
		super(data);
	}

}
