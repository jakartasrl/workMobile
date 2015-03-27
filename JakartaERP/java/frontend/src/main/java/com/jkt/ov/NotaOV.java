package com.jkt.ov;

import com.jkt.presupuesto.dominio.Nota;
import com.jkt.view.ObjectView;

/**
 * {@link ObjectView} from entity Note ({@link Nota})
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
public class NotaOV extends DescriptibleOV {

	private String adicional;
	private String codigoActividad;
//	private Boolean activo;

	public String getAdicional() {
		return adicional;
	}

	public void setAdicional(String adicional) {
		this.adicional = adicional;
	}

	public String getCodigoActividad() {
		return codigoActividad;
	}

	public void setCodigoActividad(String codigoActividad) {
		this.codigoActividad = codigoActividad;
	}

}
