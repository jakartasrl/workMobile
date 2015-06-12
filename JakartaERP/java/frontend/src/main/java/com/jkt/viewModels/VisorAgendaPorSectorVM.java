package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import lombok.Data;

import org.joda.time.LocalDate;
import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zul.Messagebox;

import com.jkt.common.Operaciones;
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

@Data
public class VisorAgendaPorSectorVM extends VisorAgendaVM {
	
	private Date fechaFiltroInicio;
	private Date fechaFiltroFin;
	private DescriptibleOV sectorSeleccionado;
	
	private Boolean fNoIniciadas = Boolean.TRUE;
	private Boolean fEnEspera = Boolean.TRUE;
	private Boolean fEnEjecucion = Boolean.TRUE;
	private Boolean fFinalizadas = Boolean.FALSE;
	
	@Init
	public void init() throws JakartaException{
		this.nuevo();
		this.vistaPorSector = true;
		
		//completo todos los estados en un mapa para poder asignarlos a las tareas.
		allStates = ((ListDescriptibleOV) Operaciones.ejecutar("TraerEstadosTareas", ListDescriptibleOV.class)).getList();
		DescriptibleOV estadoDescriptible;
		Map<String, DescriptibleOV> estadosEnMapa = new HashMap<String, DescriptibleOV>();
		for (Object estado : allStates) {
			estadoDescriptible=(DescriptibleOV) estado;
			estadosEnMapa.put(String.valueOf(estadoDescriptible.getCodigo()), estadoDescriptible);
		}
		
	}
	
	@Override
	@GlobalCommand("actualizarTodo")
	@NotifyChange({"allTasks","fNoIniciadas", "fFinalizadas", "fEnEspera"})
	public void actualizar() {

	}

	@Override
	protected String retrieveMethod() {
		return "actualizarTodo";
	}

	@Command
	public void nuevo() throws JakartaException {
		this.allTasks = new ArrayList<TareaAgendaOV>();
		
		this.sectores = ((ListDescriptibleOV) Operaciones.ejecutar("Helper", new HelperOV("sector"), ListDescriptibleOV.class)).getList();
		if (!this.sectores.isEmpty()) {
			this.sectorSeleccionado = this.sectores.get(0);
		}
		
		this.fechaFiltroInicio = LocalDate.now().toDate();
		this.fechaFiltroFin = LocalDate.now().toDate();
		
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
	}

	@SuppressWarnings("unchecked")
	@Command
	@NotifyChange("allTasks")
	public void filtrar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{

		allTasks = new ArrayList<TareaAgendaOV>(); //limpio la lista!
		
		if(!fNoIniciadas && !fEnEspera && !fEnEjecucion && !fFinalizadas){
			Messagebox.show("Debe completar un filtro de estado de tareas.");
			return;
		}
		
		ContainerOV container = new ContainerOV();
		container.setLong1(this.sectorSeleccionado.getId());

		container.setBoolean1(fNoIniciadas);
		container.setBoolean2(fEnEspera);
		container.setBoolean3(fEnEjecucion);
		container.setBoolean4(fFinalizadas);
		
		container.setFecha1(fechaFiltroInicio);
		container.setFecha2(fechaFiltroFin);
		
		List<TareaAgendaOV> tareasAMostrar = ((ListTareaAgendaOV) Operaciones.ejecutar("RecuperarTareasPorSector", container , ListTareaAgendaOV.class )).getList();
		
//		Map<String, TareaAgendaOV> mapaTareasAMostrar = new HashMap<String, TareaAgendaOV>();
		Set<Long> idsTareas = new HashSet<Long>();
		Set<Long> idPedidos = new HashSet<Long>();
		
		for (TareaAgendaOV tareaAgendaOV : tareasAMostrar) {
			
			//completo elemento x elemento el mapa de tareas a mostrar, y los ids de los diferentes pedidos...
//			mapaTareasAMostrar.put(String.valueOf(tareaAgendaOV.getId()), tareaAgendaOV);
			idsTareas.add(tareaAgendaOV.getId());
			idPedidos.add(tareaAgendaOV.getIdPedido());
			
//			DescriptibleOV descriptible = Operaciones.recuperarObjetoDescriptible("pedido", tareaAgendaOV.getIdPedido());
//			tareaAgendaOV.setPedidoDescriptible(descriptible);
			//Para mostrar el nº de comprobante de pedido
//			tareaAgendaOV.setEstado(estadosEnMapa.get(String.valueOf(tareaAgendaOV.getIdEstado())));
		}
		
		buscarTodosLosPedidos(idPedidos);
		
		//con la lista de ids, busco los pedidos y los asigno a la variable allTasks
	
		for (Long long1 : idsTareas) {
			allTasks.add(mapaFinal.get(String.valueOf(long1)));
		}
		
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);

	}
	
	
	
	private void buscarTodosLosPedidos(Set<Long> pedidos) {

		ContainerOV container = new ContainerOV();
		container.setString1("pedido");
		PedidoOV pedido;
		
		for (Long idPedido : pedidos) {
			container.setString2(String.valueOf(idPedido));
			ListPedidoOV l = (ListPedidoOV) Operaciones.ejecutar("TraerPedidoConTareas", container, ListPedidoOV.class);
			List list = l.getList();
			if(list.isEmpty() || list.size()>1){
				Messagebox.show("Ocurrio un error al intentar recuperar el pedido y sus tareas.");
				return;
			}
			pedido = (PedidoOV) list.get(0);
			armarGrafoYAsignarNotifiers(pedido , pedido.getTareas(), pedido.getPrecedentesPlanos());
		}
		
	}
	
	final Map<String, TareaAgendaOV> mapaFinal = new HashMap<String, TareaAgendaOV>();

	private void armarGrafoYAsignarNotifiers(PedidoOV pedido, List<TareaAgendaOV> allTasks, List<PrecedenteOV> list) {
		Map<String, TareaAgendaOV> tareasMap = new HashMap<String, TareaAgendaOV>();
		
		String key;
		for (TareaAgendaOV tareaAgendaOV : allTasks) {
			key = String.valueOf(tareaAgendaOV.getId());
			
			tareaAgendaOV.getPedidoDescriptible().setId(pedido.getId());
			tareaAgendaOV.getPedidoDescriptible().setCodigo(pedido.getNro());
			tareaAgendaOV.setDescripcionCliente(pedido.getDescripcionClienteSucursal());
			
			tareasMap.put(key, tareaAgendaOV); //mapa de todas las tareas por pedido
			mapaFinal.put(String.valueOf(tareaAgendaOV.getId()), tareaAgendaOV); //mapa de todas las tareas por filtro, es decir, pueden estar TODAS, y no solo x pedido.
		}
		
		//recorrer todos los precedentes y asignar los precentes tmb! esta todo en el mapa! 
		for (PrecedenteOV precedenteOV : list) {

			TareaAgendaOV tareaActual = tareasMap.get(precedenteOV.getCodigo());
			
			for (DescriptibleOV descriptibleOV : precedenteOV.getPrecedentes()) {
				TareaAgendaOV tareaAgendaOV = tareasMap.get(descriptibleOV.getCodigo());
				tareaAgendaOV.addObserver(tareaActual);
				tareaActual.getPrecedencias().add(tareaAgendaOV);
			}
			
		}
	}

	@Override
	public void cancelarCustomizado() throws JakartaException {
		this.nuevo();
	}

	public Boolean getfNoIniciadas() {
		return fNoIniciadas;
	}

	public void setfNoIniciadas(Boolean fNoIniciadas) {
		this.fNoIniciadas = fNoIniciadas;
	}

	public Boolean getfEnEspera() {
		return fEnEspera;
	}

	public void setfEnEspera(Boolean fEnEspera) {
		this.fEnEspera = fEnEspera;
	}

	public Boolean getfFinalizadas() {
		return fFinalizadas;
	}

	public void setfFinalizadas(Boolean fFinalizadas) {
		this.fFinalizadas = fFinalizadas;
	}

	public Boolean getfEnEjecucion() {
		return fEnEjecucion;
	}

	public void setfEnEjecucion(Boolean fEnEjecucion) {
		this.fEnEjecucion = fEnEjecucion;
	}
	
}
