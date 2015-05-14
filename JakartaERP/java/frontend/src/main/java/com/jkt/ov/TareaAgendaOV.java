package com.jkt.ov;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.view.ObjectView;

@SuppressWarnings("serial")
@Data
@EqualsAndHashCode(callSuper=true,of={"randomNumber"})
public class TareaAgendaOV extends ObjectView {

	private int randomNumber;
	
	private long idTarea;
	private String codigoTarea;
	private String descripcionTarea;
	
	private int duracion=1;

	private DescriptibleOV tarea=new DescriptibleOV();
	
	private String comentario;
	private Date fechaLimite=new Date();
	private Date fechaCumplimiento=new Date();
	
	private DescriptibleOV sector=new DescriptibleOV();
	private Long idSector;
	
	private DescriptibleOV estado=new DescriptibleOV();
	private int idEstado;

	private List<TareaAgendaOV> precedencias=new ArrayList<TareaAgendaOV>();
	private List<DescriptibleOV> precedenciasEnNumeros=new ArrayList<DescriptibleOV>();
	
	
	public TareaAgendaOV(){
		generateRandom();
	}
	
	public void generarRandom(){
		generateRandom();
	}

	protected void generateRandom() {
		Random rand = new Random();
	    this.randomNumber = rand.nextInt((999999 - 1) + 1) + 1;
	}
	
}
