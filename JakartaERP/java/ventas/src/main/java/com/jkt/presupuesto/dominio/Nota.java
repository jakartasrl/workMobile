package com.jkt.presupuesto.dominio;

import com.jkt.dominio.Descriptible;

/**
 * Esta clase representa una nota que puede ser adjunta a un presupuesto, un pedido, en definitiva a un comprobante, o entidades que así lo precisen.
 * <p>Los datos básicos a persistir son un código y una descripción.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Nota extends Descriptible {
	
	
	/*
	 * La variable transiente 'incluida' hacer referencia a si ya esta incluida en una lista existente en la base de datos.
	 * 
	 * Este campo decide si la entidad Nota se persiste o no.
	 * 
	 * En caso de incluida ser 'true', la entidad se debe persistir en la base.
	 * 
	 * En cas de que incluida es 'false', la entidad nota no se persistira en la base de datos, y si ya estaba persistida, 
	 * se debe eliminar de la relación. (NO SE BORRA LA NOTA, SINO LA RELACION ENTRE ENTIDAD-NOTA)
	 */
	private boolean incluida=false; //no incluida por defecto al momento de la creacion de la instancia.

	public boolean isIncluida() {
		return incluida;
	}

	public void setIncluida(boolean incluida) {
		this.incluida = incluida;
	}

	
	/*
	 * Se le cambia el nombre ya que no siempre una nota estará relacionada a un presupuesto, con lo cuál el nombre mas generico adecuado seria 'incluida'
	 * Luego de leer este comentario por favor borrar las lineas a continuacion (este comentario tambien.)
	 */
	
//	private boolean incluidaEnPresupuesto;
//
//	public boolean isIncluidaEnPresupuesto() {
//		return incluidaEnPresupuesto;
//	}
//
//	public void setIncluidaEnPresupuesto(boolean incluidaEnPresupuesto) {
//		this.incluidaEnPresupuesto = incluidaEnPresupuesto;
//	}

}
