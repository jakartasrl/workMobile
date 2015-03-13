package com.jkt.ov;

import com.jkt.view.ObjectView;

/**
 * Objeto vista que sirve para indicar metadata al help generico.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class HeaderHelpGenericoOV extends ObjectView {

	private String titulo;
	private String columnaId;
	private String columnaCodigo;
	private String columnaDescripcion;

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getColumnaId() {
		return columnaId;
	}

	public void setColumnaId(String columnaId) {
		this.columnaId = columnaId;
	}

	public String getColumnaCodigo() {
		return columnaCodigo;
	}

	public void setColumnaCodigo(String columnaCodigo) {
		this.columnaCodigo = columnaCodigo;
	}

	public String getColumnaDescripcion() {
		return columnaDescripcion;
	}

	public void setColumnaDescripcion(String columnaDescripcion) {
		this.columnaDescripcion = columnaDescripcion;
	}

}
