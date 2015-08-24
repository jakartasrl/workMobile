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
//@EqualsAndHashCode(callSuper=true)
public class TareaPedido extends DatoNodo {

//	@NotNull(message="Una tarea de pedido debe estar relacionado a un pedido.")
	private Pedido pedido;
	
	/*
	 * Si es una tarea a facturase, tendra una forma de facturacion asociada
	 */
	private boolean esTareaFacturacion = false;
	private FormaFacturacion formaFacturacion;
	
	//transiente! para generar las correspondencias.
	private int randomNumber;

	private String descripcionAbreviada;
	private String descripcionCompleta;
	
	private List<LogTarea> logs = new ArrayList<LogTarea>();
	
//	@Min(message="Los dias de duración no puede ser cero. Como mínimo un dia.", value = 1)
	private int diasDuracion;
	
//	@Future(message="La fecha limite debe ser posterior al dia actual.")
	/**
	 * Esta fecha es la fecha limite de inicio.
	 * 
	 */
	private Date fechaLimite=new Date();
	
//	@Future(message="La fecha de cumplimiento debe ser posterior al dia actual.")
	/**
	 * Es la fecha en que se cumple la tarea
	 */
	private Date fechaCumplimiento=new Date();
	
	/**
	 * Hace referencia a la fecha en que la ultima tarea fue completada
	 * Automaticamente en un grafo, donde cada tarea tiene una lista de precedentes, cuando el ultimo de todos estos precedentes es finalizado,
	 * se actualiza esta fecha, y el estado.
	 */
	private Date fechaUltimoPrecedente=new Date();

	@NotNull
	private Sector sector;
	
	private List<TareaPedido> tareas=new ArrayList<TareaPedido>();
	private List<Descriptible> tareasSimples=new ArrayList<Descriptible>();
//	private Pedido pedido;
	
	
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
