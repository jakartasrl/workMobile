package com.jkt.ov.tree;

import java.util.ArrayList;

import org.zkoss.zul.DefaultTreeNode;

import com.jkt.ov.TareaPrecedenteOV;

public class NodoTareaAgenda extends DefaultTreeNode<TareaPrecedenteOV> {
	
	public NodoTareaAgenda(TareaPrecedenteOV data) {
		super(data);
	}

	public NodoTareaAgenda(TareaPrecedenteOV data, boolean bool) {
		super(data,new ArrayList());
	}

}
