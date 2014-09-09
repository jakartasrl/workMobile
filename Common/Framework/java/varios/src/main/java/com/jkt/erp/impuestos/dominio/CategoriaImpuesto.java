package com.jkt.erp.impuestos.dominio;

import com.jkt.dominio.Descriptible;

/**
 * <p>Representa las categorias de inscripcion existentes para cada tipo de impuesto</p>
 * <p>Se utiliza pra el calculo de retenciones, percepciones, etc en el momento de facturar, pagar, cobrar, etc.</p>
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class CategoriaImpuesto extends Descriptible {
	
	private Impuesto impuesto;
	
	public Impuesto getImpuesto() {
		return impuesto;
	}

	public void setImpuesto(Impuesto impuesto) {
		this.impuesto = impuesto;
	}

}

