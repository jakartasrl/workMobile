package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zul.Window;

import lombok.Data;

import com.jkt.excepcion.JakartaException;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.TareaAgendaOV;

@Data
public abstract class VisorAgendaVM extends ViewModel{

	protected boolean vistaPorSector = false;
	protected boolean vistaPorPedido = false;
	
	protected List<TareaAgendaOV> allTasks = new ArrayList<TareaAgendaOV>();
	protected DescriptibleOV pedidoDescriptible = new DescriptibleOV();
	protected List<DescriptibleOV> sectores;

	@Command
	@NotifyChange({"allTasks"})
	public void limpiarGrilla(){
		allTasks = new ArrayList<TareaAgendaOV>();
	}
	
	@Command
	public void verDetalle(@BindingParam("elemento") TareaAgendaOV tarea){
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("tarea", tarea);
		Window window = (Window) Executions.createComponents("/pantallas/agenda/detalleTarea.zul", null, params);
		window.doModal();
	}
	
	abstract public void filtrar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;

}
