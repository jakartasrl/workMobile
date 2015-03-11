package com.jkt.ov;

import com.jkt.erp.varios.ClienteSucursal;
import com.jkt.view.ObjectView;

/**
 * ObjectView que representa a la entidad {@link ClienteSucursal}
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class SucursalOV extends ObjectView {

	private String codigo, direccion;

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

}
