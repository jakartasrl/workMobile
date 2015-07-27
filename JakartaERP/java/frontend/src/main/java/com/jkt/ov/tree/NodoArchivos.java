package com.jkt.ov.tree;

import java.util.ArrayList;

import org.zkoss.zul.DefaultTreeNode;

import com.jkt.ov.ArchivoOV;

public class NodoArchivos extends DefaultTreeNode<ArchivoOV> {

	public NodoArchivos(ArchivoOV data, boolean conHijos) {
		super(data, new ArrayList());
	}
	
	public NodoArchivos(ArchivoOV data) {
		super(data);
	}

}
