package com.jkt.erp.articulos;

import java.util.ArrayList;
import java.util.List;

import com.jkt.dominio.Descriptible;

/**
 * <p>Representa a una tabla que contiene valores</p>
 * <p>Un ejemplo puede ser representando a esta clase, una <b>tabla de colores</b> contiene valores como por ejemplo <b>rojo, azul y verde</b></p>
 * 
 * @see ValoresTablas
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TablaValoresCaracProd extends Descriptible {

	private List<ValoresTablas> valores = new ArrayList<ValoresTablas>();

	public List<ValoresTablas> getValores() {
		return valores;
	}

	public void setValores(List<ValoresTablas> valores) {
		this.valores = valores;
	}
	
	public void addValor(ValoresTablas valor){
		if (!valores.contains(valor)) {
			valores.add(valor);
			valor.setTablaValoresCaract(this);
		}
	}
	
}
