package com.jkt.agenda;

import org.apache.commons.collections.Closure;
import org.joda.time.Interval;
import org.joda.time.LocalDate;

import com.jkt.dominio.Tarea;
import com.jkt.grafo.NodoGenerico;

public class Agenda extends NodoGenerico<Tarea> {

	public void agregarTarea(NodoGenerico<Tarea> aNodo){
		Tarea tarea=this.getDato();
		Tarea tarea2=aNodo.getDato();
		
		if (tarea.getFechaFin().isBefore(tarea2.getFechaInicio())) {
			this.agregarPosterior(aNodo);
		}
	}
	
	public void atrazarFechas(){
		Tarea dato = this.getDato();
		
		LocalDate fechaActual = LocalDate.now();
		LocalDate fechaFin = dato.getFechaFin();
		
		
		if (fechaActual.isAfter(fechaFin)) {
			Interval interval = new Interval(fechaFin.toInterval().getStart(), fechaActual.toInterval().getStart());
			final long dias = interval.toDuration().getStandardDays();

			this.dfs(new Closure() {
				
				public void execute(Object input) {
					Agenda currentAgenda=(Agenda) input;
					currentAgenda.getDato().setFechaInicio(currentAgenda.getDato().getFechaInicio().plusDays(Long.valueOf(dias).intValue()));
					currentAgenda.getDato().setFechaFin(currentAgenda.getDato().getFechaFin().plusDays(Long.valueOf(dias).intValue()));
					
					System.out.println(currentAgenda.getDescripcion()+" <-> "+currentAgenda.getDato().getFechaFin());
				}
			});
			
		}
	}
	
}
