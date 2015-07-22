package com.jkt.viewModels;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import org.joda.time.LocalDate;
import org.jsoup.Jsoup;
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
		
		ContainerOV container = new ContainerOV();
		container.setString1(String.valueOf(tarea.getPedidoDescriptible().getId()));
		container.setString2(String.valueOf(tarea.getId()));
		
		if(!tarea.getDescripcionCompleta().isEmpty()){
			tarea.setDescripcionCompleta(Jsoup.parse(tarea.getDescripcionCompleta()).text());
		}
		
		precedencias = ((ListTareaAgendaOV) Operaciones.ejecutar("RecuperarTareasPrecedentes", container , ListTareaAgendaOV.class )).getList();

	}

}
