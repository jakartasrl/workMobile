package com.jkt.presupuesto.dominio;

import java.util.Date;

import lombok.Data;

/**
 * Esta clase es una exacta copia de una instancia de {@link Presupuesto} en un momento dado.
 * 
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class PresupuestoHistorial extends Presupuesto {

//	private Presupuesto presupuesto;
	private Date fechaVersionado;
	
}
