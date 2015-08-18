package com.jkt.ov;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jkt.view.ObjectView;

@Data
@EqualsAndHashCode(callSuper = true)
public class FormaFacturacionOV extends ObjectView {

	private String descripcion;
	private double porcentaje;
	private double importe;
	private DescriptibleOV condicionDePago = new DescriptibleOV();
	private long idCondicionDePago;

	private DescriptibleOV productoOV = new DescriptibleOV();
	private Long idProducto;

}
