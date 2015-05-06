package com.jkt.ov;

import groovy.transform.EqualsAndHashCode;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.Delegate;

import com.jkt.view.ObjectView;

@Data
@EqualsAndHashCode
public class TareaAgendaOV extends ObjectView {
	
	private String tarea;
	private String descripcion;
	private String comentario;
	private Date fechaLimite;
	private Date fechaCumplimiento;
	
	private DescriptibleOV sector;
	private Long idSector;
	
	private String estado;
	
	private List<TareaAgendaOV> precedencias=new ArrayList<TareaAgendaOV>();

	private List<TareaAgendaOV> todasLasTareas=new ArrayList<TareaAgendaOV>();

}
