package com.jkt.presupuesto.dominio;

import com.jkt.dominio.ComprobanteVentaDet;
import com.jkt.dominio.CotizacionDet;
import com.jkt.laboratorio.dominio.Determinacion;
import com.jkt.varios.dominio.Moneda;

/**
 * <p>Cada instancia de esta clase es un detalle de un item presupuestado</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class PresupuestoDet extends ComprobanteVentaDet{

	/*
	 * El detalle da informacion de un item, este item puede ser un producto (esta en la super clase declarado) o una determinacion.
	 * precio, moneda, cantidad, producto, en la super clase
	 */
	private CotizacionDet itemCotizado;
	private Determinacion determinacion;
	private Presupuesto presupuesto;
	private Moneda moneda;
	
	public CotizacionDet getItemCotizado() {
		return itemCotizado;
	}

	public void setItemCotizado(CotizacionDet itemCotizado) {
		this.itemCotizado = itemCotizado;
	}

	public Moneda getMoneda() {
		return moneda;
	}

	public void setMoneda(Moneda moneda) {
		this.moneda = moneda;
	}

	public Presupuesto getPresupuesto() {
		return presupuesto;
	}

	public void setPresupuesto(Presupuesto presupuesto) {
		this.presupuesto = presupuesto;
	}

	public Determinacion getDeterminacion() {
		return determinacion;
	}

	public void setDeterminacion(Determinacion determinacion) {
		this.determinacion = determinacion;
	}
	
}
