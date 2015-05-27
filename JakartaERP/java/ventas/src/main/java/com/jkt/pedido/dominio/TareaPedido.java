package com.jkt.pedido.dominio;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

import lombok.Data;

import com.jkt.dominio.Descriptible;
import com.jkt.dominio.Sector;
import com.jkt.excepcion.JakartaException;
import com.jkt.grafo.DatoNodo;

@Data
public class TareaPedido extends DatoNodo {
	
	
	//transiente! para generar las correspondencias.
	private int randomNumber;

	private String comentario;
	
//	@Min(message="Los dias de duración no puede ser cero. Como mínimo un dia.", value = 1)
	private int diasDuracion;
	
//	@Future(message="La fecha limite debe ser posterior al dia actual.")
	private Date fechaLimite=new Date();
	
//	@Future(message="La fecha de cumplimiento debe ser posterior al dia actual.")
	private Date fechaCumplimiento=new Date();
	
	@NotNull
	private Sector sector;
	
	private List<TareaPedido> tareas=new ArrayList<TareaPedido>();
	private List<Descriptible> tareasSimples=new ArrayList<Descriptible>();
	private Pedido pedido;
	
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

	private long idSector;
	private Date fechaFiltro1 , fechaFiltro2;
	
	public boolean equals(Object other) {
		if (this == other) return true;
		if ( !(other instanceof TareaPedido) ) return false;
		
		final TareaPedido entity = (TareaPedido) other;
		
		if (entity.getId()==0) return false;
		
		if ( !(entity.getId()==getId())) return false;
		
		return true;
	}
	
	public int hashCode() {
		int result;
		result = (int) (29 * getId());
		return result;
	}
	
}
