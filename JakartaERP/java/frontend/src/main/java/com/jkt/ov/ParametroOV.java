package com.jkt.ov;

import java.util.Date;

import lombok.Data;

import com.jkt.view.ObjectView;

@Data
public class ParametroOV extends ObjectView {

	private String codigo;

	private String valorCadena;
	private int valorNumero;
	private Date valorFecha;
	private double valorDoble;
	private boolean valorBooleano;

}
