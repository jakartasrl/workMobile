package com.jkt.ov;

import lombok.Data;

import com.jkt.view.ObjectView;

@Data
public class DetalleCotizacionOV extends ObjectView {

	private String nroCotizacion;
	private String nroItem;
	private String descripcion;
	private int estado;
	private String estadoDescripcion;

}
