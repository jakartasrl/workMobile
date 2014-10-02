package com.jkt.erp.articulos;

import java.util.ArrayList;
import java.util.List;

import com.jkt.dominio.Descriptible;
import com.jkt.dominio.IDetalle;

/**
 * <p>Representa a una tabla que contiene valores</p>
 * <p>Un ejemplo puede ser representando a esta clase, una <b>tabla de colores</b> contiene valores como por ejemplo <b>rojo, azul y verde</b></p>
 * 
 * @see ValoresTablas
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class TablaValoresCaracProd extends Descriptible implements IDetalle {

	private List<ValoresTablas> valoresDeTabla = new ArrayList<ValoresTablas>();

	public List<ValoresTablas> getValoresDeTabla() {
		return valoresDeTabla;
	}

	public void setValoresDeTabla(List<ValoresTablas> valoresDeTabla) {
		this.valoresDeTabla = valoresDeTabla;
	}

	public void addValor(ValoresTablas valor){
		if (!valoresDeTabla.contains(valor)) {
			valoresDeTabla.add(valor);
			valor.setTablaValoresCaract(this);
		}
	}

	public String getNombreDeMaestro() {
		return "valoresDeTabla";
	}
	
}
