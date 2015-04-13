package com.jkt.ov;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 
 * Le agregue metadata para que no se piedan referencias en la vista.
 * Leo.
 * 
 * @author erubino
 * @author ssuarez
 */
@Data
@EqualsAndHashCode(callSuper=true)
public class EquipoCaracteristicaOV extends DescriptibleOV {

	private Long idCaracteristica;
	
	private int valorEntero;
	private boolean valorBoolean;
	private String valorString;
	private double valorDouble;
	private Long idValor;
	
	private String idValorTabla;
	private String codigoValorTabla;
	private String descValorTabla;
	private DescriptibleOV valorTabla= new DescriptibleOV();
	
}
