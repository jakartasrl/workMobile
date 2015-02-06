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

	public static final char CHAR_ITEM = 'I';
	public static final char CHAR_MATERIAL = 'M';
	public static final char CHAR_ELECTRICO = 'E';
	public static final char CHAR_QUIMICO = 'Q';
	/*
	 * El detalle da informacion de un item, este item puede ser un producto (esta en la super clase declarado) o una determinacion.
	 * precio, moneda, cantidad, producto, en la super clase
	 */
	private CotizacionDet itemCotizado;
	private Determinacion determinacion;
	private Presupuesto presupuesto;
	private Moneda moneda;
	private char tipoDetalle;
	
	public char getTipoDetalle() {
		return tipoDetalle;
	}

	public void setTipoDetalle(char tipoDetalle) {
		this.tipoDetalle = tipoDetalle;
	}

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
	
	/*
	 * Helper methods
	 */
	public boolean isItem(){
		return CHAR_ITEM==this.tipoDetalle;
	}

	public boolean isMaterial(){
		return CHAR_MATERIAL==this.tipoDetalle;
	}

	public boolean isLaboratorioQuimico(){
		return CHAR_QUIMICO==this.tipoDetalle;
	}

	public boolean isLaboratorioElectrico(){
		return CHAR_ELECTRICO==this.tipoDetalle;
	}

	
}
