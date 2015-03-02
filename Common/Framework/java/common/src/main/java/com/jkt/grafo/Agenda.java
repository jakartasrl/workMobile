package com.jkt.grafo;

import org.joda.time.LocalDate;

/**
 * Es la entidad persistente.
 * <p>No contiene mucha mas logica que la del NodoGenerico, sino que:</p>
 * <p>Le declara el dato T generic.</p>
 * <p>Mapea los atributos contra la base.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Agenda extends NodoGenerico<Evento> {
	
	private LocalDate fechaInicio;
	private int diasDuracion;
	private String sector; //Puede ser laboratorio quimico, laboratorio electrico, taller, service.
	
	/*
	 * Audit for to know who was the user that finish it (task)
	 */
	private String usuario;
	
}
