package com.jkt.ov;

import lombok.Data;

@Data
public class CondPagoDetOV extends DescriptibleOV {
	
	private int dias;
	private double porcentaje;

}
