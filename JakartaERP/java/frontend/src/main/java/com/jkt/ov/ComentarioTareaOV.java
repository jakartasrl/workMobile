package com.jkt.ov;

import java.util.Date;

import lombok.Data;

import com.jkt.view.ObjectView;

@Data
public class ComentarioTareaOV extends ObjectView {

	private String comentario;
	private Date fecha;
	private String usuario;
	
	private boolean nuevo;
	
}
