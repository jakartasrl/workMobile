package com.jkt.viewModels;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.Data;

import org.jsoup.Jsoup;
import org.zkoss.bind.BindUtils;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Window;

import com.jkt.common.Operaciones;
import com.jkt.excepcion.JakartaException;
import com.jkt.grafo.DatoNodo.Estado;
import com.jkt.ov.ContainerOV;
import com.jkt.ov.DescriptibleOV;
import com.jkt.ov.ItemsOV;
import com.jkt.ov.ListDescriptibleOV;
import com.jkt.ov.TareaAgendaOV;

/**
 * Abstract class for extend both Viewers
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public abstract class VisorAgendaVM extends ViewModel {

	protected boolean vistaPorSector = false;
	protected boolean vistaPorPedido = false;
	
	protected List<TareaAgendaOV> allTasks = new ArrayList<TareaAgendaOV>();
	protected DescriptibleOV pedidoDescriptible = new DescriptibleOV();
	protected List<DescriptibleOV> sectores;
	protected List<DescriptibleOV> allStates;
	private TareaAgendaOV tarea;
	
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
	
	
	@Command
	public void finalizar(@BindingParam("elemento") final TareaAgendaOV tarea){
		final VisorAgendaVM vm = this;

		Messagebox.show("¿Desea finalizar esta tarea?", "Mensaje de confirmación", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION, new org.zkoss.zk.ui.event.EventListener() {    
			public void onEvent(Event evt) throws InterruptedException, IOException {
		        if (evt.getName().equals("onOK")) {
		        	vm.finalizarTareaConfirmada(tarea);
		        }
		    }
		}
		);
		
	}

	/**
	 * Luego de la confirmacion de finalizacion de tarea, se ejecuta este metodo
	 * Pasa de un estado en ejecucion, a finalizado.
	 * 
	 */
	public void finalizarTareaConfirmada(TareaAgendaOV tarea){
		tarea.setIdEstado(Estado.FINALIZADO.getValue());

		tarea.setFechaCumplimiento(new Date());
		
		guardarTarea(tarea);
		
		tarea.notificarCambios(this);

		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
	}
	
	@Command
	public void deshacer(@BindingParam("elemento") final TareaAgendaOV tarea){
		final VisorAgendaVM vm = this;

		Messagebox.show("¿Desea deshacer el cambio de estado de esta tarea?", "Mensaje de confirmación", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION, new org.zkoss.zk.ui.event.EventListener() {    
			public void onEvent(Event evt) throws InterruptedException, IOException {
				if (evt.getName().equals("onOK")) {
		        	vm.deshacerTareaConfirmada(tarea);
		        }
			}
		}
		);
	}
	
	/**
	 * Luego de la confirmacion se ejecuta el concreto de la operacion, es decir, el 'deshacer' de estado, el cual retorna al estado anterior.
	 * De {@link Estado} No Iniciado, a Ejecucion
	 * 
	 */
	protected void deshacerTareaConfirmada(TareaAgendaOV tarea) {
		
		if(tarea.getIdEstado()==Estado.EN_EJECUCION.getValue()){
		
			tarea.setIdEstado(Estado.NO_INICIADO.getValue());
			guardarTarea(tarea);

			BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);

		}else if(tarea.getIdEstado()==Estado.FINALIZADO.getValue()){
			
			boolean estaHabilitado = true; // para ver si esta habilitado para un cambio de estado
			for (TareaAgendaOV posterior : tarea.getPosteriores()) {
				
				//Ver si de todos los posteriores ninguno tiene el estado en ejecucion, o finalizado.
				if( posterior.getIdEstado()==Estado.EN_EJECUCION.getValue() || posterior.getIdEstado()==Estado.FINALIZADO.getValue() ){
					estaHabilitado = false;
					break;
				}
				
			}
			
			/*
			 * Si el estado es correcto, le cambio el estado a las demas tareas.
			 */
			if(estaHabilitado){

				tarea.setIdEstado(Estado.EN_EJECUCION.getValue());
				guardarTarea(tarea);
				
				
				for (TareaAgendaOV posterior : tarea.getPosteriores()) {
					posterior.setIdEstado(Estado.EN_ESPERA.getValue());
					guardarTarea(posterior);
				}

				BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
				
			}else{
				Messagebox.show("No es posible deshacer el estado de esta tarea, debido a que otras tareas dependientes de esta, ya se iniciaron o finalizaron.");
			}
			
		}

	}

	@Command
	public void iniciar(@BindingParam("elemento") final TareaAgendaOV tarea){
		
		final VisorAgendaVM vm = this;

		Messagebox.show("¿Desea iniciar esta tarea?", "Mensaje de confirmación", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION, new org.zkoss.zk.ui.event.EventListener() {    
			public void onEvent(Event evt) throws InterruptedException, IOException {
				if (evt.getName().equals("onOK")) {
		        	vm.iniciarTarea(tarea);
		        }
			}
		}
		);
		
	}
	
	/**
	 * Luego de la confirmacion se ejecuta el concreto de la operacion, es decir, el cambio de estado.
	 * De {@link Estado} No Iniciado, a Ejecucion
	 * 
	 */
	protected void iniciarTarea(TareaAgendaOV tarea) {
		tarea.setIdEstado(Estado.EN_EJECUCION.getValue());
		guardarTarea(tarea);
		BindUtils.postGlobalCommand(null, null,retrieveMethod(), null);
	}

	/**
	 * Solamente actualiza el estado
	 */
	public void guardarTarea(TareaAgendaOV tarea) {
		ContainerOV container = new ContainerOV();
		container.setString1(String.valueOf(tarea.getId()));
		container.setString2(String.valueOf(tarea.getIdEstado()));
		container.setFecha1(tarea.getFechaCumplimiento());
		container.setFecha2(tarea.getFechaUltimoPrecedente());
		Operaciones.ejecutar("ActualizarEstadoTarea", container);
	}
	
	abstract public void filtrar() throws JakartaException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;

	/**
	 * Carga los estados disponibles
	 */
	protected void inicializar() {
		allStates = ((ListDescriptibleOV) Operaciones.ejecutar("TraerEstadosTareas", ListDescriptibleOV.class)).getList();
	}
	

	/**
	 * Abre el pop up de comentarios para la tarea.
	 * Recordar que la tarea tiene comentarios automaticos, generados cundo se cambia un estado 
	 * 
	 */
	@Command
	public void comentarios(@BindingParam("elemento") final TareaAgendaOV tarea){
		Map<String, Object> parametros = new HashMap<String, Object>();
		parametros.put("tarea", tarea);
		Window window = (Window) Executions.createComponents("/pantallas/pedido/editorComentariosTareas.zul", null, parametros);
		window.doModal();
	}
	

	
}
