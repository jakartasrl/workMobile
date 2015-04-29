package com.jkt.ov.tree;

import java.util.ArrayList;

import org.zkoss.zul.DefaultTreeModel;
import org.zkoss.zul.DefaultTreeNode;
import org.zkoss.zul.TreeNode;

import com.jkt.ov.NotaOV;

public class NodoNotas extends DefaultTreeNode<NotaOV> {

	public NodoNotas(NotaOV data, boolean conHijos) {
		super(data, new ArrayList());
	}
	
	public NodoNotas(NotaOV data) {
		super(data);
	}

}
