package com.jkt.ov.tree;

import java.util.ArrayList;
import java.util.Observable;
import java.util.Observer;

import org.zkoss.zul.DefaultTreeNode;

import com.jkt.ov.TareaPrecedenteOV;

public class NodoTareaAgenda extends DefaultTreeNode<TareaPrecedenteOV>  implements Observer {
	
	public NodoTareaAgenda(TareaPrecedenteOV data) {
		super(data);
	}

	public NodoTareaAgenda(TareaPrecedenteOV data, boolean bool) {
		super(data,new ArrayList());
	}

	@Override
	public void update(Observable arg0, Object arg1) {
		System.out.println();
	}

}
