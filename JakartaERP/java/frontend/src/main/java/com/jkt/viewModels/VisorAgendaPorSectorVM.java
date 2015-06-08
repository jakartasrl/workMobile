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
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.HelperOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListTareaAgendaOV;
import com.jkt.ov.TareaAgendaOV;

@Data
public class VisorAgendaPorSectorVM extends VisorAgendaVM {

	private Date fechaFiltroInicio;
	private Date fechaFiltroFin;
	private DescriptibleOV sectorSeleccionado;
	
	
	@Init
	public void init() throws JakartaException{
		this.nuevo();
		this.vistaPorSector = true;
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

		ContainerOV container = new ContainerOV();
		container.setLong1(this.sectorSeleccionado.getId());
		container.setFecha1(this.fechaFiltroInicio);
		container.setFecha2(this.fechaFiltroFin);
		
		allTasks = ((ListTareaAgendaOV) Operaciones.ejecutar("RecuperarTareasPorSector", container , ListTareaAgendaOV.class )).getList();
		
		List allStates = ((ListDescriptibleOV) Operaciones.ejecutar("TraerEstadosTareas", ListDescriptibleOV.class)).getList();

		for (TareaAgendaOV tareaAgendaOV : allTasks) {
			DescriptibleOV descriptible = Operaciones.recuperarObjetoDescriptible("pedido", tareaAgendaOV.getIdPedido());
			tareaAgendaOV.setPedidoDescriptible(descriptible);
			
			DescriptibleOV d;
			
			for (Object object : allStates) {
				d=(DescriptibleOV) object;
				if(d.getCodigo().equals(String.valueOf(tareaAgendaOV.getIdEstado()))){
					tareaAgendaOV.setEstado(d);
					break;//break the small for!
				}
			}
			
			DescriptibleOV sector = Operaciones.recuperarObjetoDescriptible("sector", tareaAgendaOV.getIdSector());
			tareaAgendaOV.setSector(sector);
		}
		
	}

	@Override
	public void cancelarCustomizado() throws JakartaException {
		this.nuevo();
	}

	
}
