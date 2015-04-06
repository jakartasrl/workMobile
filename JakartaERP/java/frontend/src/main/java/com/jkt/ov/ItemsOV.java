package com.jkt.ov;

import lombok.Data;

import com.jkt.view.ObjectView;

@Data
public class ItemsOV extends ObjectView {

	private DescriptibleOV plantilla=new DescriptibleOV();
	private String descripcion;
	
	private DescriptibleOV productoOV=new DescriptibleOV();
	private Long idProducto;
	
	private String tipo;
	private String referencia;
	private int cantidad;
	private DescriptibleOV moneda=new DescriptibleOV();
	private Long idMoneda;
	private double importe;
	private double importeTotal;
	
	private Long idDeterminacion;
	private String codigo;
	private String codAnalisis;
	private String desAnalisis;
	
}
