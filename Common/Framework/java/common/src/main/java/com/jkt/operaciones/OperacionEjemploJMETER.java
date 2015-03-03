package com.jkt.operaciones;

import java.util.Map;

import org.joda.time.LocalDate;

import com.jkt.agenda.Evento;
import com.jkt.agenda.EventoAgenda;
import com.jkt.grafo.Agendable;

public class OperacionEjemploJMETER extends Operation {

	@Override
	public void execute(Map<String, Object> aParams) throws Exception {
		EventoAgenda eventoAgenda = raiz();
		eventoAgenda.agregarPosterior(next());
		guardar(eventoAgenda);
	}

	private EventoAgenda raiz() {
		EventoAgenda eventoAgenda = new EventoAgenda();
		
		eventoAgenda.setDiasDuracion(5);
		eventoAgenda.setFechaInicio(LocalDate.now().plusDays(5));
		eventoAgenda.setDescripcion("Cobrar anticipo");
		eventoAgenda.setCompleto(false);
		eventoAgenda.setFechaFin(LocalDate.now().plusDays(5));
		
		Evento nodoUno = new Evento();

		Agendable objetivo=new Agendable();
		objetivo.setClaseTarea("com.jkt.leo10");
		objetivo.setIdTarea(33L);
		
		nodoUno.setObjetivo(objetivo);
		
		eventoAgenda.setDato(nodoUno);
		return eventoAgenda;
	}

	private EventoAgenda next() {
		EventoAgenda eventoAgenda = new EventoAgenda();
		
		eventoAgenda.setDiasDuracion(3);
		eventoAgenda.setFechaInicio(LocalDate.now().plusDays(11));
		eventoAgenda.setDescripcion("Armar planos");
		eventoAgenda.setCompleto(false);
		eventoAgenda.setFechaFin(LocalDate.now().plusDays(5));
		
		Evento nodoUno = new Evento();
		
		Agendable objetivo=new Agendable();
		objetivo.setClaseTarea("com.jkt.leo10.notas.Algo");
		objetivo.setIdTarea(6L);
		
		nodoUno.setObjetivo(objetivo);
		
		eventoAgenda.setDato(nodoUno);
		return eventoAgenda;
	}

}
