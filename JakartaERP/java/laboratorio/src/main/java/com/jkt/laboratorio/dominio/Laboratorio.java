package com.jkt.laboratorio.dominio;

import java.util.ArrayList;
import java.util.List;

import com.jkt.dominio.Descriptible;

/**
 * Representa un Laboratorio existente en la Empresa. 
 * Se utiliza para clasificar los Análisis que se realizan. 
 * Ejemplo: Laboratorio Químico. Laboratorio Físico.
 */
public class Laboratorio extends Descriptible {

	
	private List<Determinacion> determinaciones=new ArrayList<Determinacion>();

	public List<Determinacion> getDeterminaciones() {
		return determinaciones;
	}

	public void setDeterminaciones(List<Determinacion> determinaciones) {
		this.determinaciones = determinaciones;
	}
	
	public void agregarDeterminacion(Determinacion determinacion){
		if(!this.determinaciones.contains(determinacion)){
			this.determinaciones.add(determinacion);
			determinacion.setLaboratorio(this);
		}
	}
	
}
