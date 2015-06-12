package com.jkt.ov;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Observable;
import java.util.Observer;
import java.util.Random;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.grafo.DatoNodo.Estado;
import com.jkt.view.ObjectView;
import com.jkt.viewModels.VisorAgendaVM;

@SuppressWarnings("serial")
@Data
@EqualsAndHashCode(callSuper = true, of = { "randomNumber" })
public class TareaAgendaOV extends ObjectView implements Observer{

	private int randomNumber;
	
	private long idTarea;
	private String codigoTarea;
	private String descripcionTarea;
	private String descripcionAbreviada;
	private String descripcionCompleta;
	
	private int duracion = 1;

	private DescriptibleOV tarea = new DescriptibleOV();

	private Date fechaLimite = new Date();
	private Date fechaCumplimiento;//= new Date();
	private Date fechaUltimoPrecedente;// = new Date();

	private DescriptibleOV sector = new DescriptibleOV();
	private Long idSector;

	private DescriptibleOV estado = new DescriptibleOV();
	private int idEstado;

	private List<TareaAgendaOV> precedencias = new ArrayList<TareaAgendaOV>();
	
	private List<DescriptibleOV> precedenciasEnNumeros = new ArrayList<DescriptibleOV>();
	
	private Long idPedido;
	private DescriptibleOV pedidoDescriptible = new DescriptibleOV();
	
	private String descripcionCliente;
	
	public TareaAgendaOV(){
		generateRandom();
		this.idEstado = Estado.NO_INICIADO.getValue();
	}
	
	public void generarRandom(){
		generateRandom();
	}

	protected void generateRandom() {
		Random rand = new Random();
	    this.randomNumber = rand.nextInt((999999 - 1) + 1) + 1;
	}

	@Override
	public void update(Observable o, Object arg) {
		
		Map <String, Object> args = (Map<String, Object>) arg;
		
		TareaAgendaOV tareaQueCambioEstado = (TareaAgendaOV) args.get("tarea");
		List<TareaAgendaOV> precedencias = this.getPrecedencias();//la tarea que se recupero tiene las precedentes
		
		for (TareaAgendaOV tareaAgendaOV : precedencias) {
			if (tareaAgendaOV!=tareaQueCambioEstado) {
				if (tareaAgendaOV.getIdEstado()!=Estado.FINALIZADO.getValue()) {
					return; //Si una tarea no es finalizada, no se hace nada, ya que x lo menos una precedencia esta sin cumplir...
				}
			}
		}
		
		//Si no tiene precedencias, o tiene, pero todas estan finalizadas, se le cambia el estado a la tarea.
		this.fechaUltimoPrecedente = new Date();
		this.idEstado = Estado.NO_INICIADO.getValue();

		// Guardar la tarea
		VisorAgendaVM visorVM = (VisorAgendaVM) args.get("vm");
//		visorVM.guardarTarea(tareaQueCambioEstado); //finalizo la tarea... no se si hace falta
		visorVM.guardarTarea(this);//le cambio el estado a iniciado :D
		
	}

	public void notificarCambios(VisorAgendaVM vm) {
		this.setChanged();
		
		Map <String, Object> args = new HashMap<String, Object>();
		
		args.put("vm", vm);
		args.put("tarea", this);
		
		this.notifyObservers(args);
	}
	
}
