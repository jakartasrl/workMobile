package com.jkt.dominio;

/**
 * Representa a un presupuesto. El presupuesto contendra una determinada
 * cantidad de items donde cada uno tiene su propios presupuestos, reflejados en
 * el precio, la unidad de medida, la cantidad
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class Presupuesto extends ComprobanteVenta {

	private String formasDePago;
	private String notas;

	public String getFormasDePago() {
		return formasDePago;
	}

	public void setFormasDePago(String formasDePago) {
		this.formasDePago = formasDePago;
	}

	public String getNotas() {
		return notas;
	}

	public void setNotas(String notas) {
		this.notas = notas;
	}

}
