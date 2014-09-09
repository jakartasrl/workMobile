package com.jkt.erp.varios;

import java.util.Date;

import com.jkt.dominio.PersistentEntity;
import com.jkt.varios.dominio.CondPago;

/**
 * <p>
 * Relacion entre un {@link Cliente} y una {@link CondPago} que posee una fecha
 * de vigencia.
 * </p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class CondPagoCliente extends PersistentEntity {

	private static final long serialVersionUID = 6573920058882410427L;

	private Cliente cliente;
	private Date fechaVigencia;

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Date getFechaVigencia() {
		return fechaVigencia;
	}

	public void setFechaVigencia(Date fechaVigencia) {
		this.fechaVigencia = fechaVigencia;
	}

}
