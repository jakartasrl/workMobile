package com.jkt.agenda;

import lombok.Data;

import org.joda.time.LocalDate;

import com.jkt.grafo.NodoGenerico;

/**
 * Es la entidad persistente.
 * <p>No contiene mucha mas logica que la del NodoGenerico, sino que:</p>
 * <p>Le declara el dato T generic.</p>
 * <p>Mapea los atributos contra la base.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class EventoAgenda extends NodoGenerico<Evento> {

	
	/*
	 * Variables de instancia
	 */
	private LocalDate fechaInicio=LocalDate.now();
	private int diasDuracion=1;
	private String sector; //Puede ser laboratorio quimico, laboratorio electrico, taller, service.
	
	/*
	 * Audit for to know who was the user that finish it (a task)
	 */
	private String usuario;
	private LocalDate fechaFin;
	private int diasAtrasados=0;
	
}
