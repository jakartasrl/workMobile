package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Observable;

import lombok.Data;

import org.apache.commons.collections.Closure;
import org.apache.commons.collections.CollectionUtils;
import org.joda.time.LocalDate;
import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.TreeNode;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.dto.EventoDTO;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.HelperOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListPedidoOV;
import com.jkt.ov.ListTareaAgendaOV;
import com.jkt.ov.PedidoOV;
import com.jkt.ov.PrecedenteOV;
import com.jkt.ov.TareaAgendaOV;
import com.jkt.ov.TareaPrecedenteOV;
import com.jkt.ov.tree.NodoTareaAgenda;

@Data
public class VisorAgendaPorPedidoVM extends VisorAgendaVM {

	@Init
	public void init(){
		super.inicializar();
		this.vistaPorPedido = true;
	}
	
	@Override
	@GlobalCommand("actualizarTodo")
	@NotifyChange({"allTasks"})
	public void actualizar() {

	}

	@Override
	protected String retrieveMethod() {
		return "actualizarTodo";
	}

	@Command
	@NotifyChange("allTasks")
	public void filtrar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		openComplexHelper("pedido", "", pedidoDescriptible, "postHelperPedido", "Pedidos Disponibles", "Nro Pedido", "Cliente",true, "Fecha" , "" );
	}

	public void postHelperPedido() throws JakartaException{

		ContainerOV container = new ContainerOV();
		container.setString1("pedido");
		container.setString2(String.valueOf(pedidoDescriptible.getId()));
		
		ListPedidoOV l = (ListPedidoOV) Operaciones.ejecutar("TraerPedidoConTareas", container, ListPedidoOV.class);
		List list = l.getList();
		if(list.isEmpty() || list.size()>1){
			Messagebox.show("Ocurrio un error al intentar recuperar el pedido y sus tareas.");
			return;
		}
		PedidoOV pedido = (PedidoOV) list.get(0);

		allTasks = pedido.getTareas();
		allStates = ((ListDescriptibleOV) Operaciones.ejecutar("TraerEstadosTareas", ListDescriptibleOV.class)).getList();
		DescriptibleOV estadoDescriptible;
		Map<String, DescriptibleOV> estadosEnMapa = new HashMap<String, DescriptibleOV>();
		for (Object estado : allStates) {
			estadoDescriptible=(DescriptibleOV) estado;
			estadosEnMapa.put(String.valueOf(estadoDescriptible.getCodigo()), estadoDescriptible);
		}
		
		for (TareaAgendaOV tareaAgendaOV : allTasks) {
			tareaAgendaOV.setPedidoDescriptible(pedidoDescriptible);
			tareaAgendaOV.setEstado(estadosEnMapa.get(String.valueOf(tareaAgendaOV.getIdEstado())));
			tareaAgendaOV.setSector(Operaciones.recuperarObjetoDescriptible("sector", tareaAgendaOV.getIdSector()));
		}
		
		/*
		 * Aca voy a asignar las precedencias de las tareas!!!
		 */
		
		armarGrafoYAsignarNotifiers(allTasks, pedido.getPrecedentesPlanos());
		
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);

	}

	private void armarGrafoYAsignarNotifiers(List<TareaAgendaOV> allTasks, List<PrecedenteOV> list) {
		Map<String, TareaAgendaOV> tareasMap = new HashMap<String, TareaAgendaOV>();
		
		for (TareaAgendaOV tareaAgendaOV : allTasks) {
			tareasMap.put(String.valueOf(tareaAgendaOV.getId()), tareaAgendaOV);
		}
		
		//recorrer todos los precedentes y asignar los precentes tmb! esta todo en el mapa! 
		for (PrecedenteOV precedenteOV : list) {

			TareaAgendaOV tareaActual = tareasMap.get(precedenteOV.getCodigo());
			
			for (DescriptibleOV descriptibleOV : precedenteOV.getPrecedentes()) {
//				tareaActual.addObserver(tareasMap.get(descriptibleOV.getCodigo()));
				TareaAgendaOV tareaAgendaOV = tareasMap.get(descriptibleOV.getCodigo());
				tareaAgendaOV.addObserver(tareaActual);
				tareaActual.getPrecedencias().add(tareaAgendaOV);
			}
			
		}
		
	}

	@Override
	public void cancelarCustomizado() throws JakartaException {
//		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
	}

}
