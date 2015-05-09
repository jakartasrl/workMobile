package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import lombok.Data;

import org.apache.commons.beanutils.BeanUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zul.TreeNode;

import com.jkt.excepcion.JakartaException;
import com.jkt.ov.AgendaOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.TareaAgendaOV;
import com.jkt.ov.TareaPrecedenteOV;
import com.jkt.ov.tree.NodoTareaAgenda;

@Data
public class AgendaVM extends ViewModel implements IBasicOperations{
	
	private AgendaOV agenda;
	
	private String codigoTareaNueva;
	
	@Init
	public void init(){
		this.setTitulo("Planificación del Pedido");
		this.agenda=new AgendaOV();
	}
	
	@Command
	@Override
	public void guardar() throws JakartaException {
		
	}

	
	@Command
	@Override
	public void nuevo() throws JakartaException {
		
	}

	
	DescriptibleOV pedidoDescriptible = new DescriptibleOV();

	@Override
	@Command
	@NotifyChange("titulo")
	public void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		openComplexHelper("pedido", "", pedidoDescriptible, "recuperarAgendaPedido", "Pedidos Disponibles", "Nro Pedido", "Cliente", false , "Fecha" , "" );
	}
	
	public void recuperarAgendaPedido(){
		this.setTitulo("Planificación del Pedido '"+this.pedidoDescriptible.getCodigo()+"' .");
	}


	@GlobalCommand("actualizar")
	@NotifyChange({"titulo","agenda"})
	public void actualizar() {
		
	}

	
	protected String retrieveMethod() {
		return "actualizar";
	}
	
	private TareaAgendaOV tareaAgregada;
	private NodoTareaAgenda siguienteRoot;

	@Command
	@NotifyChange("agenda")
	public void eliminarTarea(@BindingParam("tarea") TareaAgendaOV tarea){
		this.agenda.getTareasGenerales().remove(tarea);
		List<TreeNode<TareaPrecedenteOV>> children = this.agenda.getArbolPrecedencias().getRoot().getChildren();
		
		TreeNode<TareaPrecedenteOV> nodoRootABorrar = null; //se setea y se borra al final de todo, ya que sino se pierden referencias en las listas...
		
		for (TreeNode<TareaPrecedenteOV> treeNode : children) {
			//Si es el actual lo seteo a nodoRootABorrar, para borrarlo luego y no perder el indice en la colccion q estoy recorriendo.
			if (treeNode.getData().getTarea()==tarea) {
				nodoRootABorrar=treeNode;
			}else{
				//sino tengo q recorrer los hijos de cada uno...
				List<TreeNode<TareaPrecedenteOV>> hijos = treeNode.getChildren();
				for (TreeNode<TareaPrecedenteOV> hijo : hijos) {
					if (hijo.getData().getTarea()==tarea) {
						hijos.remove(hijo);
						break;
					}
				}
				
			}
		}
		if (nodoRootABorrar!=null) {
			children.remove(nodoRootABorrar);
		}
	}
	
	
	@Command
	@NotifyChange("agenda")
	public void agregarTareaGeneral() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, JakartaException{
		

		this.tareaAgregada=new TareaAgendaOV();

		if (this.codigoTareaNueva!=null && !this.codigoTareaNueva.isEmpty()) {
			validarCampo("tarea", this.codigoTareaNueva, this.tareaAgregada.getTarea(), "actualizarTareasYArbol");
			return;
		}
		actualizarTareas();
		openComplexHelper("tarea", "", this.tareaAgregada.getTarea(), "actualizarArboles", "Seleccionar tarea", "Tarea", "Descripción", true , "" , "" );
	}
	
	public void actualizarTareasYArbol() throws IllegalAccessException, InvocationTargetException{
		actualizarTareas();
		actualizarArboles();
	}
	
	public void actualizarTareas(){
		this.agenda.getTareasGenerales().add(this.tareaAgregada);
		TareaPrecedenteOV tareaPrecedenteOV = new TareaPrecedenteOV();
		tareaPrecedenteOV.setTarea(this.tareaAgregada);
		this.siguienteRoot=new NodoTareaAgenda(tareaPrecedenteOV, true);
		this.agenda.getArbolPrecedencias().getRoot().add(siguienteRoot);
	}
	
	public void actualizarArboles() throws IllegalAccessException, InvocationTargetException{
		List<TreeNode<TareaPrecedenteOV>> nodosHijos = this.agenda.getArbolPrecedencias().getRoot().getChildren();
		List<TareaAgendaOV> todasLasTareas = this.agenda.getTareasGenerales();
		
		//Agrega a cada nodo el nuevo elemento
		for (TreeNode<TareaPrecedenteOV> nodoActual : nodosHijos) {
				if (nodoActual!=this.siguienteRoot) { //el nodo recientemente agregado ya pertenece al arbol, x eso este if
					TareaPrecedenteOV nuevoPrecedente=new TareaPrecedenteOV();
					nuevoPrecedente.setTarea(this.tareaAgregada);
					NodoTareaAgenda nuevoNodo=new NodoTareaAgenda(nuevoPrecedente);
					nodoActual.add(nuevoNodo);
				}
		}
		
		//para el nuevo elemento, agregar todos menos a mi mismo.
		for (TareaAgendaOV tareaActual : todasLasTareas) {
			if (tareaActual!=this.tareaAgregada) {
				TareaPrecedenteOV nuevaPrecedencia=new TareaPrecedenteOV();
				nuevaPrecedencia.setTarea(tareaActual);
				this.siguienteRoot.add(new NodoTareaAgenda(nuevaPrecedencia));
			}
		}
		
	}
}
