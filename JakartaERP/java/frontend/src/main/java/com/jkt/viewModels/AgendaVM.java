package com.jkt.viewModels;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.Data;

import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.GlobalCommand;
import org.zkoss.bind.annotation.Init;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zul.Window;

import com.jkt.excepcion.JakartaException;
import com.jkt.ov.AgendaOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.TareaAgendaOV;

@Data
public class AgendaVM extends ViewModel implements IBasicOperations{
	
	private AgendaOV agenda;
	
	@Init
	public void init(){
		this.setTitulo("Agenda de Pedido");
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
		this.setTitulo("Agenda del Pedido '"+this.pedidoDescriptible.getCodigo()+"' .");
	}


	@GlobalCommand("actualizar")
	@NotifyChange("titulo")
	public void actualizar() {
		
	}

	
	protected String retrieveMethod() {
		return "actualizar";
	}
	
	@Command
	@NotifyChange("agenda")
	public void agregarTareaGeneral(){
		TareaAgendaOV tarea= new TareaAgendaOV();
		this.getAgenda().getTareasGenerales().add(tarea);
	}
	
	
	/*
	 * Mostrar todas las precedencias y sus seleccionados
	 */
	@Command
	public void abrirPrecedencias(@BindingParam("actual") TareaAgendaOV actual){
		
		List<TareaAgendaOV> todasLasTareas = this.agenda.obtenerTodasLasTareas(actual);
		actual.setTodasLasTareas(todasLasTareas);
		
		Map<String, Object> args=new HashMap<String, Object>();
		args.put("tarea", actual);
		
		Window window = (Window) Executions.createComponents("/pantallas/agenda/helpPrecedencias.zul", null, args);
		
		window.doModal();
		
	}
	
	
}
