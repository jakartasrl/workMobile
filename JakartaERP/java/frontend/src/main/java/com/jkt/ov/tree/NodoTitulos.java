package com.jkt.ov.tree;

import java.util.ArrayList;

import lombok.Data;

import org.zkoss.zk.ui.Component;
import org.zkoss.zul.DefaultTreeNode;

import com.jkt.ov.TituloModeloCotizadorOV;

@Data
public class NodoTitulos extends DefaultTreeNode<TituloModeloCotizadorOV>{
	
	private Component componenteAsociado;
	
	public NodoTitulos(TituloModeloCotizadorOV data, boolean conHijos) {
		super(data, new ArrayList());
	}
	
	public NodoTitulos(TituloModeloCotizadorOV data) {
		super(data);
	}

}
