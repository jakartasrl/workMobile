package com.jkt.ov;

import com.jkt.view.ObjectView;

/**
 * Objeto vista que sirve para indicar metadata al help generico.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class HeaderHelpGenericoOV extends ObjectView {

	private String titulo="Consulta generica";
	private String columnaId;
	private String columnaCodigo = "Código";
	private String columnaDescripcion = "Descripción";
	
	private String columnaAdicional1;
	private String columnaAdicional2;
	
	public String getColumnaAdicional1() {
		return columnaAdicional1;
	}

	public void setColumnaAdicional1(String columnaAdicional1) {
		this.columnaAdicional1 = columnaAdicional1;
	}

	public String getColumnaAdicional2() {
		return columnaAdicional2;
	}

	public void setColumnaAdicional2(String columnaAdicional2) {
		this.columnaAdicional2 = columnaAdicional2;
	}

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
