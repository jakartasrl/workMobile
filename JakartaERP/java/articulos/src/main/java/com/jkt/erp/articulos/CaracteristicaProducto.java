package com.jkt.erp.articulos;

import com.jkt.dominio.Descriptible;

/**
 * <p>Una caracteristica de producto puede ser una longitud, un color, un tipo de tela, un tipo de metal, ancho, largo, peso.</p>
 * 
 * @author ssuarez
 * 
 */
public class CaracteristicaProducto extends Descriptible {

	private String tipoDato;
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
