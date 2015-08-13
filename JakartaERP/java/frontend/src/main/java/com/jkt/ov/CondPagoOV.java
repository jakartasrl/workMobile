package com.jkt.ov;

import java.util.HashSet;
import java.util.Set;

import lombok.Data;

@Data
public class CondPagoOV extends DescriptibleOV {
	
	private boolean baseFechaFactura;
	private boolean baseFechaRecep;
	private Set<CondPagoDetOV> detalles = new HashSet<CondPagoDetOV>();

}
