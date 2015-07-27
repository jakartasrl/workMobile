package com.jkt.ov;

import java.util.Date;

import org.zkoss.util.media.Media;

import lombok.Data;

import com.jkt.view.ObjectView;

@Data
public class ArchivoOV extends ObjectView {

	private Date fechaSubida;
	private long idUsuario;
	private String usuario;
	private String descripcion;
	private String comentario;
	
	private String fileURL;
	private String fileName;
	
	private String contentType;
	private String format;
	private int idCategoria;

}
