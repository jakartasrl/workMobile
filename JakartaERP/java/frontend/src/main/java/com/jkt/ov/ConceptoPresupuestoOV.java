package com.jkt.ov;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class ConceptoPresupuestoOV extends DescriptibleOV {

	private Boolean pideArticulo = Boolean.FALSE;
	private long idComponenteValor;
	private long idMoneda;
	private long idUnidadMedida;

	private DescriptibleOV moneda = new DescriptibleOV();
	private DescriptibleOV unidadMedida = new DescriptibleOV();
	private DescriptibleOV componenteValor = new DescriptibleOV();
	
	
	private String codigoMoneda;
	private String descripcionMoneda;

	private String codigoUnidadMedida;
	private String descripcionUnidadMedida;

}
