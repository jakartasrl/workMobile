package com.jkt.viewModels;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import org.joda.time.LocalDate;
import org.zkoss.bind.annotation.ExecutionArgParam;
import org.zkoss.bind.annotation.Init;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.ListTareaAgendaOV;
import com.jkt.ov.TareaAgendaOV;

@Data
public class DetalleTareaVM {

	private TareaAgendaOV tarea;
	private List<TareaAgendaOV> precedencias = new ArrayList<TareaAgendaOV>();
	
	@Init
	public void init(@ExecutionArgParam("tarea") TareaAgendaOV tarea) throws JakartaException{
		this.tarea=tarea;
		
		ListDescriptibleOV l = (ListDescriptibleOV) Operaciones.ejecutar("TraerEstadosTareas", ListDescriptibleOV.class);
		List list = l.getList();
		DescriptibleOV d;
		
		for (Object object : list) {
			d=(DescriptibleOV) object;
			if(d.getCodigo().equals(String.valueOf(this.tarea.getIdEstado()))){
				this.tarea.setEstado(d);
				break;
			}
		}
		
		DescriptibleOV sector = Operaciones.recuperarObjetoDescriptible("sector", this.tarea.getIdSector());
		this.tarea.setSector(sector);
		
		
		
		//cargando precedencias
		ContainerOV container = new ContainerOV();
		container.setLong1(1L);
		container.setFecha1(LocalDate.now().toDate());
		container.setFecha2(LocalDate.now().toDate());
		
		precedencias = ((ListTareaAgendaOV) Operaciones.ejecutar("RecuperarTareasPorSector", container , ListTareaAgendaOV.class )).getList();
	}

}
