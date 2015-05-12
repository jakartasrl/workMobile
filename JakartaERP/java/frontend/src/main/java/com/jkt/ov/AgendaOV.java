package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.zul.DefaultTreeModel;
import org.zkoss.zul.TreeNode;

import lombok.Data;

import com.jkt.ov.tree.NodoTareaAgenda;
import com.jkt.view.ObjectView;

@Data
public class AgendaOV extends ObjectView {

	private List<TareaAgendaOV> tareasGenerales = new ArrayList<TareaAgendaOV>();
	private DefaultTreeModel<TareaPrecedenteOV> arbolPrecedencias;
	
	public AgendaOV(){
		NodoTareaAgenda root=new NodoTareaAgenda(new TareaPrecedenteOV(), true);
		this.arbolPrecedencias=new DefaultTreeModel<TareaPrecedenteOV>(root);
	}
	
	public List<TareaAgendaOV> obtenerTodasLasTareas(@BindingParam("tareaActual") TareaAgendaOV tarea){
		List<TareaAgendaOV> tareasFiltradas = new ArrayList<TareaAgendaOV>();
		
		for (TareaAgendaOV tareaAgendaOV : tareasGenerales) {
			if (tareaAgendaOV!=tarea) {
				tareasFiltradas.add(tareaAgendaOV);
			}
		}
		return tareasFiltradas;
	}

}
