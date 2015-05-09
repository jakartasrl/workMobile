package com.jkt.ov;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.view.ObjectView;

@Data
@EqualsAndHashCode(callSuper=true)
public class TareaPrecedenteOV extends ObjectView {

	private TareaAgendaOV tarea;
	private Boolean esPrecedente = Boolean.FALSE;

}
