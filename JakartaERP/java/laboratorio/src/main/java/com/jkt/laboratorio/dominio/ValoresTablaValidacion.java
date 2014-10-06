package com.jkt.laboratorio.dominio;

import com.jkt.dominio.Descriptible;

/**
 * Representa los valores cargados en las tablas existentes para validar al valor de una Determinación.<br>
 * Se utiliza para validar los valores de las determinaciones ingresados.<br>
 * Ejemplo: Durezas Nivel A . Durezas Nivel B.
 */
public class ValoresTablaValidacion extends Descriptible {

	private static final long serialVersionUID = 1L;

	/**
	 * Tabla para ingresar los valores.
	 */
	private TablaValidacionDeter tablaValidacion;

	/* -------------------------------------- Getters & Setters -------------------------------------- */
	public TablaValidacionDeter getTablaValidacion() {
		return tablaValidacion;
	}

	public void setTablaValidacion(TablaValidacionDeter tablaValidacion) {
		this.tablaValidacion = tablaValidacion;
	}

}
