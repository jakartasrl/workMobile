package com.jkt.ov;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import com.jkt.laboratorio.dominio.Determinacion;
import com.jkt.view.ObjectView;

/**
 * {@link ObjectView} de una {@link Determinacion} Habria que tratar de no tener
 * 50 OVS para una determinacion, sino que la opcion es ir agregando los pocos
 * campos necesarios ac�.
 * 
 * @author Leonel Suarez - Jakarta SRL
 */
@Data
public class DeterminacionOV extends ObjectView {

	private String idItem;
	private String codigo;
	private String descripcion;
	private String codAnalisis;
	private String desAnalisis;
	private double importe;
	private DescriptibleOV moneda;
	
	private List<MetodoOV> metodos = new ArrayList<MetodoOV>();
	
	private String tipoResultado;
	
}



