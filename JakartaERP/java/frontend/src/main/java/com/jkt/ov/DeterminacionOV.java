package com.jkt.ov;

import com.jkt.laboratorio.dominio.Determinacion;
import com.jkt.view.ObjectView;

/**
 * {@link ObjectView} de una {@link Determinacion} Habria que tratar de no tener
 * 50 OVS para una determinacion, sino que la opcion es ir agregando los pocos
 * campos necesarios acá.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class DeterminacionOV extends ObjectView {

	private String idItem;
	private String codigo;
	private String descripcion;
	private String codAnalisis;
	private String desAnalisis;
	private double importe;

	public String getIdItem() {
		return idItem;
	}

	public void setIdItem(String idItem) {
		this.idItem = idItem;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getCodAnalisis() {
		return codAnalisis;
	}

	public void setCodAnalisis(String codAnalisis) {
		this.codAnalisis = codAnalisis;
	}

	public String getDesAnalisis() {
		return desAnalisis;
	}

	public void setDesAnalisis(String desAnalisis) {
		this.desAnalisis = desAnalisis;
	}

	public double getImporte() {
		return importe;
	}

	public void setImporte(double importe) {
		this.importe = importe;
	}

}
