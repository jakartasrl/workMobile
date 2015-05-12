package com.jkt.grafo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;

import com.jkt.dominio.Descriptible;
import com.jkt.dominio.Sector;
import com.jkt.excepcion.JakartaException;

@Data
public class TareaPedido extends DatoNodo {
	
	//transiente! para generar las correspondencias.
	private int randomNumber;

	private String comentario;
	private int diasDuracion;
	private Date fechaLimite=new Date();
	private Date fechaCumplimiento=new Date();
	
	private Sector sector;
	
	private String estado;
	
	private List<TareaPedido> tareas=new ArrayList<TareaPedido>();
	private List<Descriptible> tareasSimples=new ArrayList<Descriptible>();
	
	/*
	 * Estos metodos quedan sin utilidad, ya que serán utilizados para entidades mas complejas.
	 * En muchas circunstancias se puede dar que el dato del nodo defina si se puede completar la tarea, internamente, 
	 * sin tener en cuenta las precedencias y posteriores.
	 * 
	 */
	
	@Override
	protected boolean sePuedeFinalizar() throws JakartaException {
		return true;
	}

	@Override
	protected boolean sePuedeIniciar() throws JakartaException {
		return true;
	}

}
