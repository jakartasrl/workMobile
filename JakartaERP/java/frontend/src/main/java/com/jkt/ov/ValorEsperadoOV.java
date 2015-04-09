package com.jkt.ov;

import lombok.Data;

import com.jkt.view.ObjectView;

@Data
public class ValorEsperadoOV extends ObjectView {
	
	private MetodoOV metodo;
	private CaracteristicaProductoOV caracteristica;
	private double valorDesde;
	private double valorHasta;
	private String limite;

}
