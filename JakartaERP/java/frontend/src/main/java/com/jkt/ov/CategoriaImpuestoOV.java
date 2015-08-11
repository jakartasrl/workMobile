package com.jkt.ov;

import lombok.Data;

@Data
public class CategoriaImpuestoOV extends DescriptibleOV {
	
	private ImpuestoOV impuesto;
	private long idImpuesto;

}
