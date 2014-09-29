package com.jkt.erp.articulos;

import com.jkt.constantes.TiposDeDato;
import com.jkt.dominio.Descriptible;

/**
 * 
 * <p>Una caracteristica de producto puede ser una longitud, un color, un tipo de tela, un tipo de metal, ancho, largo, peso.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class CaracteristicaProducto extends Descriptible {

	/**
	 * Define el tipo de dato que contendra esta caracteristica.
	 * 
	 * @see TiposDeDato
	 */
	private String tipoDato;//Del mismo valor que la clase TiposDeDato.
	
	private TablaValoresCaracProd tabla;

	public String getTipoDato() {
		return tipoDato;
	}

	public void setTipoDato(String tipoDato) {
		this.tipoDato = tipoDato;
	}

	public TablaValoresCaracProd getTabla() {
		return tabla;
	}

	public void setTabla(TablaValoresCaracProd tabla) {
		this.tabla = tabla;
	}

}
