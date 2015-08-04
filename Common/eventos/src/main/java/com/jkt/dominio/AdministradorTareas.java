package com.jkt.dominio;

public class AdministradorTareas {

	public void verEstadoDeTarea(int id){
		Tarea tarea = null;
		verEstadoDeTarea(tarea);
		
	}
	
	public Estado verEstadoDeTarea(Tarea tarea){
		return tarea.getEstadoActual();
	}

	
	
}
