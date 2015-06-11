package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.Data;

import org.joda.time.LocalDate;
import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zul.Checkbox;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.HelperOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListTareaAgendaOV;
import com.jkt.ov.TareaAgendaOV;
import com.jkt.ov.tree.NodoTareaAgenda;

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
		
		//Actualiza todo el vm
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
	}

	@SuppressWarnings("unchecked")
	@Command
	@NotifyChange("allTasks")
	public void filtrar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{

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
		
		allTasks = ((ListTareaAgendaOV) Operaciones.ejecutar("RecuperarTareasPorSector", container , ListTareaAgendaOV.class )).getList();
		
//		List 
		allStates = ((ListDescriptibleOV) Operaciones.ejecutar("TraerEstadosTareas", ListDescriptibleOV.class)).getList();
		DescriptibleOV estadoDescriptible;
		Map<String, DescriptibleOV> estadosEnMapa = new HashMap<String, DescriptibleOV>();
		for (Object estado : allStates) {
			estadoDescriptible=(DescriptibleOV) estado;
			estadosEnMapa.put(String.valueOf(estadoDescriptible.getCodigo()), estadoDescriptible);
		}
		
		for (TareaAgendaOV tareaAgendaOV : allTasks) {
			
			DescriptibleOV descriptible = Operaciones.recuperarObjetoDescriptible("pedido", tareaAgendaOV.getIdPedido());
			tareaAgendaOV.setPedidoDescriptible(descriptible);
			//Para mostrar el nº de comprobante de pedido
			tareaAgendaOV.setEstado(estadosEnMapa.get(String.valueOf(tareaAgendaOV.getIdEstado())));
//			tareaAgendaOV.setSector(Operaciones.recuperarObjetoDescriptible("sector", tareaAgendaOV.getIdSector())); //Este no es necesario, ya que son todas las tareas de mismo sector
		}
		
	}
	
//	@Command
//	public void modificarFiltros(@BindingParam("checkComponent") Checkbox checkComponent){
//		if(checkComponent.isChecked()){
//			this.fEnEspera=Boolean.FALSE;
//			this.fNoIniciadas=Boolean.FALSE;
//		}else{
//			this.fEnEspera=Boolean.TRUE;
//			this.fNoIniciadas=Boolean.TRUE;
//		}
//	}

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
