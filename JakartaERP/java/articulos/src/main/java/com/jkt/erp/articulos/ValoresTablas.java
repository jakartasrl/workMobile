package com.jkt.erp.articulos;

import com.jkt.dominio.Descriptible;
import com.jkt.dominio.IDetalle;

/**
 * <p>Representa a los valores de una tabla.</p>
 * <p>Como en el ejemplo de {@link TablaValoresCaracProd}, una tabla puede representar a una <b>tabla de colores</b>, y los valores serian <b>rojo, azul, verde.</b></p>
 * <p>Cada instancia de esta clase, en este ejemplo, seria un color.</p>
 * 
 * @see TablaValoresCaracProd
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class ValoresTablas extends Descriptible implements IDetalle {

	private TablaValoresCaracProd tablaValoresCaract;

	public TablaValoresCaracProd getTablaValoresCaract() {
		return tablaValoresCaract;
	}

	public void setTablaValoresCaract(TablaValoresCaracProd tablaValoresCaract) {
		this.tablaValoresCaract = tablaValoresCaract;
	}

	public String getNombreDeMaestro() {
		return "tablaValoresCaract";
	}

}
