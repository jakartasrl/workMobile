package com.jkt.ov;

import java.util.Observable;
import java.util.Observer;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.view.ObjectView;

@Data
@EqualsAndHashCode(callSuper=true)
public class TareaPrecedenteOV extends ObjectView{

	private TareaAgendaOV tarea;
	private Boolean esPrecedente = Boolean.FALSE;
	private Boolean editable= Boolean.TRUE;
	
}
