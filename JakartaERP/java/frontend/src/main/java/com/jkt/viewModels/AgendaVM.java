package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zul.TreeNode;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.AgendaOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.PedidoOV;
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

		List<TreeNode<TareaPrecedenteOV>> nodosPrincipales = this.agenda.getArbolPrecedencias().getRoot().getChildren();
		
		List<TareaAgendaOV> tareas=new ArrayList<TareaAgendaOV>();//Todas las tareas a enviar a la operacion
		TareaAgendaOV tarea;
		
		List<TreeNode<TareaPrecedenteOV>> hijos;//Cada lista sera la lista de hijos

		for (TreeNode<TareaPrecedenteOV> nodoActual : nodosPrincipales) {
			tarea = nodoActual.getData().getTarea();

			
			tarea.setIdTarea(tarea.getTarea().getId());
			tarea.setCodigoTarea(tarea.getTarea().getCodigo());
			tarea.setDescripcionTarea(tarea.getTarea().getDescripcion());
			
			tareas.add(tarea);//tarea level0, agregarla a la lista de tareas SI O SI
			
			hijos = nodoActual.getChildren();
			List<DescriptibleOV> listaPrecedencias=new ArrayList<DescriptibleOV>();
			for (TreeNode<TareaPrecedenteOV> nodoLevel2 : hijos) {
				if (nodoLevel2.getData().getEsPrecedente()) {
//					tarea.getPrecedencias().add(nodoLevel2.getData().getTarea());
					DescriptibleOV descriptibleOV = new DescriptibleOV();
					descriptibleOV.setCodigo(String.valueOf(nodoLevel2.getData().getTarea().getRandomNumber()));
					listaPrecedencias.add(descriptibleOV);
//					tarea.getPrecedenciasEnNumeros().add(descriptibleOV);
				}
			}
			tarea.setPrecedenciasEnNumeros(listaPrecedencias);
		}
		
		PedidoOV pedidoAGuardar = this.agenda.getPedido();
		pedidoAGuardar.setId(this.pedidoDescriptible.getId());
		pedidoAGuardar.setTareas(tareas);
		Operaciones.ejecutar("GenerarPlanificacionPedido", pedidoAGuardar);
	}

	
	@Command
	@Override
	@NotifyChange({"agenda","pedidoDescriptible"})
	public void nuevo() throws JakartaException {
		this.agenda=new AgendaOV();
		this.pedidoDescriptible=new DescriptibleOV();
	}

	DescriptibleOV pedidoDescriptible = new DescriptibleOV();

	@Override
	@Command
	@NotifyChange({"titulo","agenda","pedidoDescriptible"})
	public void buscar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		openComplexHelper("pedido", "", pedidoDescriptible, "recuperarAgendaPedido", "Pedidos Disponibles", "Nro Pedido", "Cliente", false , "Fecha" , "" );
	}
	
	public void recuperarAgendaPedido(){
		this.setTitulo("Planificación del Pedido '"+this.pedidoDescriptible.getCodigo()+"' .");
	}


	@GlobalCommand("actualizar")
	@NotifyChange({"titulo","agenda","pedidoDescriptible"})
	public void actualizar() {
		
	}

	
	protected String retrieveMethod() {
		return "actualizar";
	}
	
	private TareaAgendaOV tareaAgregada;
	private NodoTareaAgenda siguienteRoot;

	/**
	 * Elimina una tarea de las tareas generales, y del arbol de precedencias
	 */
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
	
	
	/**
	 * Agrega una nueva tarea, utilizando el campo de texto para, o bien cagar una tarea, o abrir una ventana con las disponibles.
	 * 
	 */
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
	
	private void actualizarTareas(){
		this.agenda.getTareasGenerales().add(this.tareaAgregada);
		TareaPrecedenteOV tareaPrecedenteOV = new TareaPrecedenteOV();
		tareaPrecedenteOV.setTarea(this.tareaAgregada);
		this.siguienteRoot=new NodoTareaAgenda(tareaPrecedenteOV, true);
		this.agenda.getArbolPrecedencias().getRoot().add(siguienteRoot);
	}
	
	/**
	 * Actualiza el arbol de precedencias al agregar o quitar una tarea.
	 */
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
