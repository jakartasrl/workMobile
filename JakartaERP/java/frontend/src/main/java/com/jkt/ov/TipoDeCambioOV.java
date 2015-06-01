package com.jkt.ov;

import lombok.Data;

import com.jkt.varios.dominio.Moneda;
import com.jkt.view.ObjectView;

@Data
public class TipoDeCambioOV extends ObjectView {
	
	private long idMoneda;
	private String codMoneda;
	private String descMoneda;
	
	private double cotizacion;

}
