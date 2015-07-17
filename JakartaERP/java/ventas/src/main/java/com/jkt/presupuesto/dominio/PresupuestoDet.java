package com.jkt.presupuesto.dominio;

import javax.validation.constraints.NotNull;

import lombok.Data;

import com.jkt.dominio.ComprobanteVentaDet;
import com.jkt.dominio.CotizacionDet;
import com.jkt.laboratorio.dominio.Determinacion;
import com.jkt.varios.dominio.Moneda;

/**
 * <p>Cada instancia de esta clase es un detalle de un item presupuestado</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
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
	
	@NotNull(message="El detalle de presupuesto tiene que tener una moneda obligatoriamente.")
	private Moneda moneda;
	
	private char tipoDetalle;
	
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
