package com.jkt.ov;

import java.util.Date;
import lombok.Data;

@Data
public class ProtocoloEstadisticaOV extends DescriptibleOV {
	
	private long idDeterminacion;
	private String descDeterminacion;
	private Date fechaCreacion;
	private double resultadoExpresion;

}
